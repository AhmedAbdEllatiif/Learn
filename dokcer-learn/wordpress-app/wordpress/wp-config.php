<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wp' );

/** Database username */
define( 'DB_USER', 'wp' );

/** Database password */
define( 'DB_PASSWORD', 'secret' );

/** Database hostname */
define( 'DB_HOST', 'mysql' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '6)(4S>^fK7$)88)B0/P/vH@@6.Yw],.ILh65{V!&wne%OL{N^TbYqcM*Ky3)0RDY' );
define( 'SECURE_AUTH_KEY',  'e<c$ftg?Lghu6#9GJw^-wjk_C5=@8x|_e-5}KMFTtw#Pg0xA132}ewYqi+|;lheg' );
define( 'LOGGED_IN_KEY',    'ieCT4WP1ZTREpGK?zg5+~bDjR`2[HwjC7MwJ)dO*7]>X]g)8^YB;z-fe 5/&@F,S' );
define( 'NONCE_KEY',        'NtrF=Fdj69nDLi}*IE6<BU]Q/7ZgkwXzBXCmwYiU!W;o(E~`p-6F]Ni.I/YO=dQ ' );
define( 'AUTH_SALT',        'p4M>c}e~)a[a@bqsNa.}Fj_[u2]_>6,`t &3}BPz|X$*mykJ?yD/w>x*]-*3Q]#*' );
define( 'SECURE_AUTH_SALT', '?d1v+RMf@Pjs,1$nXq+v@Du#P5:FNXrF5ABq-R@C{kJ;HXl@c9dpOth z1e~@Vwv' );
define( 'LOGGED_IN_SALT',   'v<9<CNW Sc}ZCa#!8lCu*VvY3w8_g_`8,doEfY y-xleri0B/HkKVCyV%va.03I(' );
define( 'NONCE_SALT',       '80nuEk{Ao9s5k9(X_TS;L;2ckLg6,3C@_>g~S%;400vbI.Pu<d%h4+IT6nN$yXRT' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
