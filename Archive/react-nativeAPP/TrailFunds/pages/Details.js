import * as React from '@react-navigation/native';
import { StyleSheet, Text, View, Button, Alert } from 'react-native';
import defaultSty from '../style/defaultSty'
import HomePage from './Home';
import PrimaryButton from '../style/primeButt';
import SecondaryButton from '../style/secondButt';
import HollowButton from '../style/hollowButt';


function DetailPage({ navigation }) {
    return(
        <View style={defaultSty.container}>
            <Text style={defaultSty.head1}>
                About Us
            </Text>

            <Text style={defaultSty.subStyle}>
            Trail Funds is a B-Corp that was grown out of the Maverick Innovation Center and created and ran by the students at Colorado Mesa University Under the Lead of Bryan, Dan, Steve All with the benefit and maintenance of trails in mind. The team consisted of A diverse set of skills.
            </Text>

            <Text style={defaultSty.head1}>
                Our Mission
            </Text>
            
            <Text style={defaultSty.subStyle}>
            Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
            </Text>

            <Text style={defaultSty.head1}>
                Meet our Backers
            </Text>

            <Button //This will be the default button and the OS of the system will make it there own
                title = "Become a Backer"
                onPress={() => Alert.alert('Will send to Become a Backer page')}
                style={defaultSty.buttonSty1}
            />





            
        </View>
    );
}

export default DetailPage;