//███╗░░░███╗███████╗████████╗░█████╗░██████╗░░█████╗░████████╗░█████╗░  ██╗████████╗███████╗███╗░░░███╗░██████╗
//████╗░████║██╔════╝╚══██╔══╝██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗  ██║╚══██╔══╝██╔════╝████╗░████║██╔════╝
//██╔████╔██║█████╗░░░░░██║░░░███████║██║░░██║███████║░░░██║░░░███████║  ██║░░░██║░░░█████╗░░██╔████╔██║╚█████╗░
//██║╚██╔╝██║██╔══╝░░░░░██║░░░██╔══██║██║░░██║██╔══██║░░░██║░░░██╔══██║  ██║░░░██║░░░██╔══╝░░██║╚██╔╝██║░╚═══██╗
//██║░╚═╝░██║███████╗░░░██║░░░██║░░██║██████╔╝██║░░██║░░░██║░░░██║░░██║  ██║░░░██║░░░███████╗██║░╚═╝░██║██████╔╝
//╚═╝░░░░░╚═╝╚══════╝░░░╚═╝░░░╚═╝░░╚═╝╚═════╝░╚═╝░░╚═╝░░░╚═╝░░░╚═╝░░╚═╝  ╚═╝░░░╚═╝░░░╚══════╝╚═╝░░░░░╚═╝╚═════╝░

function FormatItemInfo(itemData) {
	if (itemData != null && itemData.info != "") {
        if (itemData.info.showAllDescriptions) {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html("<p>" + tableToString(itemData.info) + "</p>");
            return
        }
        if (itemData.name == "id_card") {
            var gender = "Man";
            if (itemData.info.gender == 1) {
                gender = "Woman";
            }
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html(
                "<p><strong>First Name: </strong><span>" +
                itemData.info.firstname +
                "</span></p><p><strong>Last Name: </strong><span>" +
                itemData.info.lastname +
                "</span></p><p><strong>Birth Date: </strong><span>" +
                itemData.info.birthdate +
                "</span></p><p><strong>Gender: </strong><span>" +
                gender +
                "</span></p>"
            );
        } else if (itemData.name == "bmx") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html(
                "<p><strong>Color Primary: </strong><span>" +
                itemData.info.color_1 +
                "<strong> Secondary: </strong>" +
                itemData.info.color_2 +
                "<strong> Pearlescent: </strong>" +
                itemData.info.perl +
                "</span></p><p><strong>Dirty level: </strong><span>" +
                itemData.info.dirt +
                "</span></p><p><strong>Plate: </strong><span>" +
                itemData.info.plate +
                "</span></p><p><strong>Wheels State: </strong><span>" +
                itemData.info.neu1 +
                "</span></p><p><strong>ID: </strong><span>" +
                itemData.info.id +
                "</span></p>"
            );
        
        
        } else if (itemData.name == "bmx_rgb") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html(
                "<p><strong>RGB Primary: </strong><span>" +
                itemData.info.prim_r + itemData.info.prim_g + itemData.info.prim_b +
                "<strong> RGB Primary Secondary: </strong>" +
                itemData.info.sec_r + itemData.info.sec_g + itemData.info.sec_b +
                "<strong> Pearlescent: </strong>" +
                itemData.info.perl +
                "</span></p><p><strong>Dirty level: </strong><span>" +
                itemData.info.dirt +
                "</span></p><p><strong>Plate: </strong><span>" +
                itemData.info.plate +
                "</span></p><p><strong>Wheels State: </strong><span>" +
                itemData.info.neu1 +
                "</span></p><p><strong>ID: </strong><span>" +
                itemData.info.id +
                "</span></p>"
            );
        } else if (itemData.name == "photo") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html(
                "<p><span>" +
                itemData.info.location +
                "</span></p><span>" +
                itemData.info.date + "</span></p>"
            );
        } else if (itemData.name == "driver_license") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html(
                "<p><strong>First Name: </strong><span>" +
                itemData.info.firstname +
                "</span></p><p><strong>Last Name: </strong><span>" +
                itemData.info.lastname +
                "</span></p><p><strong>Birth Date: </strong><span>" +
                itemData.info.birthdate +
                "</span></p><p><strong>Licenses: </strong><span>" +
                itemData.info.type +
                "</span></p>"
            );
        } else if (itemData.name == "weaponlicense") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html(
                "<p><strong>First Name: </strong><span>" +
                itemData.info.firstname +
                "</span></p><p><strong>Last Name: </strong><span>" +
                itemData.info.lastname +
                "</span></p><p><strong>Birth Date: </strong><span>" +
                itemData.info.birthdate +
                "</span></p>"
            );
        } else if (itemData.name == "lawyerpass") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html(
                "<p><strong>Pass-ID: </strong><span>" +
                itemData.info.id +
                "</span></p><p><strong>First Name: </strong><span>" +
                itemData.info.firstname +
                "</span></p><p><strong>Last Name: </strong><span>" +
                itemData.info.lastname +
                "</span></p><p><strong>CSN: </strong><span>" +
                itemData.info.citizenid +
                "</span></p>"
            );
        } else if (itemData.name == "harness") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html(
                "<p>" + itemData.info.uses + " uses left.</p>"
            );
        } else if (itemData.name == "vehiclekeys") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html(
                "<p><strong>Plate: </strong><span>" +
                itemData.info.plate +
                "</span></p><p><strong>Model: </strong><span>" +
                itemData.info.description +
                "</span></p>"
            );
        } else if (itemData.name == "written_note") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html(
                "<p><strong>Text: </strong><span>" +
                itemData.info.text +
                "</span></p>"
            );
		} else if (itemData.name == "backpack") {
			$(".item-info-title").html('<p>' + itemData.label + '</p>')
			$(".item-info-description").html(
				'<p><strong>' + QUASAR.Lang("INVENTORY_BAG") + ' ' + 
				'</strong><span>' + itemData.info.bagid + '</span></p>'
				);
		} else if (itemData.name == "game_ticket") {
            $(".item-info-title").html('<p>'+itemData.label+'</p>')
            $(".item-info-description").html('<p><strong>' + QUASAR.Lang("INVENTORY_SERIAL") + 
			'</strong><span>' + itemData.info.cardnumber + 
			'</span></p><p>'+ itemData.description + '</p>'
			);
		} else if (itemData.type == "weapon") {
			$(".item-info-title").html('<p>' + itemData.label + '</p>')
			if (itemData.info.ammo == undefined) {
				itemData.info.ammo = 0;
			} else {
				itemData.info.ammo != null ? itemData.info.ammo : 0;
			}
			if (itemData.info.attachments != null) {
				var attachmentString = "";
				$.each(itemData.info.attachments, function(i, attachment) {
					if (i == (itemData.info.attachments.length - 1)) {
						attachmentString += attachment.label
					} else {
						attachmentString += attachment.label + ", "
					}
				});
				$(".item-info-description").html('<p><strong>' + QUASAR.Lang("INVENTORY_SERIAL") + 
				' </strong><span>' + itemData.info.serie + 
				'</span></p><p><strong>' + QUASAR.Lang("INVENTORY_AMMUNITION") + 
				'</strong><span>' + itemData.info.ammo + '</span></p><p><strong>' + QUASAR.Lang("INVENTORY_ADDITIONS") + 
				'</strong><span>' + attachmentString + '</span></p>'
				);
			} else {
				$(".item-info-description").html('<p><strong>' + QUASAR.Lang("INVENTORY_SERIAL") + ' </strong><span>' + itemData.info.serie + '</span></p><p><strong>' + QUASAR.Lang("INVENTORY_AMMUNITION") + '</strong><span>' + itemData.info.ammo + '</span></p><p>' + itemData.description + '</p>');
			}
		} else if (itemData.name == "filled_evidence_bag") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            if (itemData.info.type == "casing") {
                $(".item-info-description").html(
                    "<p><strong>Evidence material: </strong><span>" +
                    itemData.info.label +
                    "</span></p><p><strong>Type number: </strong><span>" +
                    itemData.info.ammotype +
                    "</span></p><p><strong>Caliber: </strong><span>" +
                    itemData.info.ammolabel +
                    "</span></p><p><strong>Serial Number: </strong><span>" +
                    itemData.info.serie +
                    "</span></p><p><strong>Crime scene: </strong><span>" +
                    itemData.info.street +
                    "</span></p><br /><p>" +
                    itemData.description +
                    "</p>"
                );
            } else if (itemData.info.type == "blood") {
                $(".item-info-description").html(
                    "<p><strong>Evidence material: </strong><span>" +
                    itemData.info.label +
                    "</span></p><p><strong>Blood type: </strong><span>" +
                    itemData.info.bloodtype +
                    "</span></p><p><strong>DNA Code: </strong><span>" +
                    itemData.info.dnalabel +
                    "</span></p><p><strong>Crime scene: </strong><span>" +
                    itemData.info.street +
                    "</span></p><br /><p>" +
                    itemData.description +
                    "</p>"
                );
            } else if (itemData.info.type == "fingerprint") {
                $(".item-info-description").html(
                    "<p><strong>Evidence material: </strong><span>" +
                    itemData.info.label +
                    "</span></p><p><strong>Fingerprint: </strong><span>" +
                    itemData.info.fingerprint +
                    "</span></p><p><strong>Crime Scene: </strong><span>" +
                    itemData.info.street +
                    "</span></p><br /><p>" +
                    itemData.description +
                    "</p>"
                );
            } else if (itemData.info.type == "dna") {
                $(".item-info-description").html(
                    "<p><strong>Evidence material: </strong><span>" +
                    itemData.info.label +
                    "</span></p><p><strong>DNA Code: </strong><span>" +
                    itemData.info.dnalabel +
                    "</span></p><br /><p>" +
                    itemData.description +
                    "</p>"
                );
            }
		} else if (itemData.info.type == "note") {
			$(".item-info-title").html('<p>'+itemData.label+'</p>')
			$(".item-info-description").html('<p>'+ itemData.description + 
			'</p><p>'+itemData.info.info+'</p>'
			);
		} else if (itemData.name == "markedbills") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html(
                "<p><strong>Worth: </strong><span>$" +
                itemData.info.worth +
                "</span></p>"
            );
        } else if (itemData.name == "visa" || itemData.name == "mastercard") {
            $(".item-info-title").html('<p>'+itemData.label+'</p>')
            var str = ""+ itemData.info.cardNumber + "";
            var res = str.slice(12);
            var cardNumber = "************" + res;
            $(".item-info-description").html('<p><strong>Card Holder: </strong><span>' + itemData.info.name + '</span></p><p><strong>Citizen ID: </strong><span>' + itemData.info.citizenid + '</span></p><p><strong>Card Number: </strong><span>' + cardNumber + '</span></p>');			
        } else if (itemData.name == "labkey") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html("<p>Lab: " + itemData.info.lab + "</p>");
		} else if (itemData.info.costs != undefined && itemData.info.costs != null) {
			$(".item-info-title").html('<p>' + itemData.label + '</p>')
			$(".item-info-description").html('<p>' + itemData.info.costs + '</p>');
		} else {
			$(".item-info-title").html('<p>' + itemData.label + '</p>')
			$(".item-info-description").html('<p>' + itemData.description + '</p>')
		}
	} else {
		$(".item-info-title").html('<p>' + itemData.label + '</p>')
		$(".item-info-description").html('<p>' + itemData.description + '</p>')
	}
}