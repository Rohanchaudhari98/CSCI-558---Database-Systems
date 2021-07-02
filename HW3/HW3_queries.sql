-- CREATE EXTENSION postgis CASCADE;
-- CREATE EXTENSION postgis_topology CASCADE;
--Create Table
CREATE TABLE convexhull (location_name varchar, pt geometry);
INSERT INTO convexhull VALUES
	('Tommy Trojan','POINT(-118.2854360735196 34.02073083708017)'),
	('USC Viterbi','POINT(-118.28933686587312 34.02070885034971)'),
	('Cromwell','POINT(-118.28786032534094 34.022085535131936)'),
	('USC Cinematic','POINT(-118.28683249140144 34.02367734679794)'),
	('USC Thornton','POINT(-118.2854360735196 34.02329182022096)'),
	('Interfaith Com','POINT(-118.28432113172342 34.02314369788436)'),
	('USC Dworak-Peck','POINT(-118.28251783027858 34.022455952269276)'),
	('Starbucks','POINT(-118.28218791687927 34.02173592284136)'),
	('McCarthy Quad','POINT(-118.28304056536729 34.02088759534512)'),
	('USC Sol Price','POINT(-118.28359071382307 34.01951256450874)'),
	('USC Marshall','POINT(-118.28546826002592 34.01879226374124)'),
	('USC Roski','POINT(-118.28735653506423 34.01940585366961)');

-- Query 1 - Convex Hull
SELECT ST_AsText(ST_ConvexHull(ST_Collect(pt))) as cor into cord1 FROM convexhull1;

-- Query 2 - Centroid of above calculated Convex Hull
SELECT ST_AsText(ST_Centroid(ST_COLLECT(cor))) from cord1;
-- Centroid of Convex Hull = (-118.28563726685304 34.02123054167791)

-- Query 3 - Distance between Centroid and Tommy Trojan
SELECT ST_Distance(ST_Transform('SRID=4326;POINT(-118.2854360735196 34.02073083708017)'::geometry,3857),
                   ST_Transform('SRID=4326;POINT(-118.28563726685304 34.02123054167791)'::geometry,3857))*cosd(34.02073083708017) as distance;
-- Here, we multiple by cos(latitude) = cos(34.02073083708017) here, to get a more accurate result of distance by accounting for distortion.
-- Distance Value according to above query = 58.64263408303309 meters

