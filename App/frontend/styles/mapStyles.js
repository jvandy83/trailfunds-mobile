import React, { useEffect, useState, useRef } from 'react';
import { StyleSheet, Dimensions } from 'react-native';
import MapView from 'react-native-maps';
import * as Location from 'expo-location';
import { AntDesign, Octicons } from '@expo/vector-icons';
import { defaults } from './frontendStyles';
import Collapsible from 'react-native-collapsible';

// TODO: Map GeoFence Polygons + Search Function (on-click polygons opens info drawer)

var width = Dimensions.get('window').width; //full width
var height = Dimensions.get('window').height; //full height

export const mapStyles = StyleSheet.create({
	map: {
		width: '100%',
		height: '100%',
	},

	like: {
		width: 80,
		height: 80,
		backgroundColor: '#C05987',
		borderRadius: 40,
		flex: 0,
		justifyContent: 'center',
		alignItems: 'center',
		flexDirection: 'column',
		borderWidth: 1,
		borderColor: '#8b355b',
	},
	like_menu: {
		alignSelf: 'stretch',
		left: '25%',
		bottom: '105%',
		width: '250%',
		height: 300,
		flexDirection: 'column',
		borderBottomRightRadius: 25,
		borderBottomLeftRadius: 25,
		backgroundColor: 'black',
		borderTopRightRadius: 75,
		borderTopLeftRadius: 10,
	},
	like_list_header: {
		paddingBottom: 20,
		paddingTop: 20,
		paddingLeft: 20,
		borderWidth: 1,
		borderColor: 'transparent',
		borderTopLeftRadius: 10,
		borderTopRightRadius: 100,
		backgroundColor: '#90566F',
	},
	like_list_content: {
		backgroundColor: '#90566F',
		overflow: 'hidden',
		paddingTop: 10,
		paddingBottom: 20,
		borderBottomLeftRadius: 20,
		borderBottomRightRadius: 20,
	},
	search: {
		width: 80,
		height: 80,
		backgroundColor: '#59C092',
		borderRadius: 40,
		flex: 0,
		justifyContent: 'center',
		alignItems: 'center',
		flexDirection: 'column',
		borderWidth: 1,
		borderColor: '#348963',
	},
	search_menu: {
		alignSelf: 'stretch',
		right: '75%',
		bottom: '105%',
		width: '250%',
		height: 350,
		flexDirection: 'column',
		borderBottomRightRadius: 25,
		borderBottomLeftRadius: 25,
		backgroundColor: 'black',
		borderTopRightRadius: 75,
		borderTopLeftRadius: 75,
	},
	search_header: {
		paddingBottom: 20,
		paddingTop: 20,
		borderWidth: 1,
		borderColor: 'transparent',
		borderTopLeftRadius: 100,
		borderTopRightRadius: 100,
		backgroundColor: '#338762',
	},
	search_title: {
		color: 'white',
		fontSize: 25,
		textAlign: 'center',
	},
	search_container: {
		height: 276,
		borderBottomLeftRadius: 25,
		borderBottomRightRadius: 25,
		backgroundColor: '#338762',
		alignItems: 'center',
		justifyContent: 'center',
		flexDirection: 'row',
	},
	near: {
		width: 80,
		height: 80,
		backgroundColor: '#5F59C0',
		borderRadius: 40,
		flex: 0,
		justifyContent: 'center',
		alignItems: 'center',
		flexDirection: 'column',
		borderWidth: 1,
		borderColor: '#3a358a',
	},
	near_menu: {
		alignSelf: 'stretch',
		right: '175%',
		bottom: '105%',
		width: '250%',
		height: 300,
		flexDirection: 'column',
		borderBottomRightRadius: 25,
		borderBottomLeftRadius: 25,
		backgroundColor: 'black',
		borderTopRightRadius: 10,
		borderTopLeftRadius: 75,
	},
	near_list_header: {
		paddingBottom: 20,
		paddingTop: 20,
		paddingRight: 20,
		borderWidth: 1,
		borderColor: 'transparent',
		borderTopLeftRadius: 100,
		borderTopRightRadius: 10,
		backgroundColor: '#585591',
	},
	near_list_content: {
		backgroundColor: '#585591',
		overflow: 'hidden',
		paddingTop: 10,
		paddingBottom: 20,
		borderBottomLeftRadius: 20,
		borderBottomRightRadius: 20,
	},
	list_title: {
		color: 'white',
		fontSize: 25,
	},
	list_spacer: {
		height: 2,
		backgroundColor: 'black',
	},
	list_box: {
		borderBottomWidth: 1,
		borderRadius: 50,
		paddingLeft: 20,
		paddingRight: 20,
	},
	list_text: {
		fontSize: 18,
		paddingTop: 8,
		paddingBottom: 4,
		color: 'white',
	},
});
