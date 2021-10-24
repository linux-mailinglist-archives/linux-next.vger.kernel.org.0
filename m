Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC1E7438C8E
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 01:28:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231603AbhJXXa1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 24 Oct 2021 19:30:27 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:33685 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231516AbhJXXa1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 24 Oct 2021 19:30:27 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HcvQW5kvGz4xZ1;
        Mon, 25 Oct 2021 10:28:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635118085;
        bh=86P5yjVYjQNnPiQ3BlQbigI/vBY+MAT6lQAdQ8JOTeY=;
        h=Date:From:To:Cc:Subject:From;
        b=u3f0QbOSlfcJSspkhjRJ45+VSp0BSxs9KD0mtH8H8h5HY4UW17KlUwtknmSD6Kcwh
         qeLA0VXbCGT7OgWfexRyPknv8MM5dOw3TCdlGiAMN9+Sna2NKt0jr8AN0Fb4fopIOX
         0cpZiIhtzDFsx6vwVPXUyWJsiFmSZRFomk1WlBCprKzpLL47xPJVzYF/9yl+ozpaW3
         r3hiy6OhM8KIuBDjaAWts7AGKDrQpGb0Mmw81pPoUc+SF5S5uuxCGcu+luLkAhChJI
         /c6r60I74NheuP4ApmlrGR9SaD6F1H5QniuIPaspboujJKPnBZYGNnR0PTneipsjdi
         Zgp5l/ypBdLsQ==
Date:   Mon, 25 Oct 2021 10:28:02 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andy Gross <agross@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Heidelberg <david@ixit.cz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the qcom tree
Message-ID: <20211025102802.11a92147@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ptewabXvebv++qFXSo5WEGI";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ptewabXvebv++qFXSo5WEGI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the qcom tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

arch/arm/boot/dts/qcom-ipq8064.dtsi:52.19-70.5: Warning (thermal_sensors_pr=
operty): /thermal-zones/sensor0-thermal: Missing property '#thermal-sensor-=
cells' in node /soc/clock-controller@900000/thermal-sensor@900000 or bad ph=
andle (referred from thermal-sensors[0])
arch/arm/boot/dts/qcom-ipq8064.dtsi:72.19-90.5: Warning (thermal_sensors_pr=
operty): /thermal-zones/sensor1-thermal: Missing property '#thermal-sensor-=
cells' in node /soc/clock-controller@900000/thermal-sensor@900000 or bad ph=
andle (referred from thermal-sensors[0])
arch/arm/boot/dts/qcom-ipq8064.dtsi:92.19-110.5: Warning (thermal_sensors_p=
roperty): /thermal-zones/sensor2-thermal: Missing property '#thermal-sensor=
-cells' in node /soc/clock-controller@900000/thermal-sensor@900000 or bad p=
handle (referred from thermal-sensors[0])
arch/arm/boot/dts/qcom-ipq8064.dtsi:112.19-130.5: Warning (thermal_sensors_=
property): /thermal-zones/sensor3-thermal: Missing property '#thermal-senso=
r-cells' in node /soc/clock-controller@900000/thermal-sensor@900000 or bad =
phandle (referred from thermal-sensors[0])
arch/arm/boot/dts/qcom-ipq8064.dtsi:132.19-150.5: Warning (thermal_sensors_=
property): /thermal-zones/sensor4-thermal: Missing property '#thermal-senso=
r-cells' in node /soc/clock-controller@900000/thermal-sensor@900000 or bad =
phandle (referred from thermal-sensors[0])
arch/arm/boot/dts/qcom-ipq8064.dtsi:152.19-170.5: Warning (thermal_sensors_=
property): /thermal-zones/sensor5-thermal: Missing property '#thermal-senso=
r-cells' in node /soc/clock-controller@900000/thermal-sensor@900000 or bad =
phandle (referred from thermal-sensors[0])
arch/arm/boot/dts/qcom-ipq8064.dtsi:172.19-190.5: Warning (thermal_sensors_=
property): /thermal-zones/sensor6-thermal: Missing property '#thermal-senso=
r-cells' in node /soc/clock-controller@900000/thermal-sensor@900000 or bad =
phandle (referred from thermal-sensors[0])
arch/arm/boot/dts/qcom-ipq8064.dtsi:192.19-210.5: Warning (thermal_sensors_=
property): /thermal-zones/sensor7-thermal: Missing property '#thermal-senso=
r-cells' in node /soc/clock-controller@900000/thermal-sensor@900000 or bad =
phandle (referred from thermal-sensors[0])
arch/arm/boot/dts/qcom-ipq8064.dtsi:212.19-230.5: Warning (thermal_sensors_=
property): /thermal-zones/sensor8-thermal: Missing property '#thermal-senso=
r-cells' in node /soc/clock-controller@900000/thermal-sensor@900000 or bad =
phandle (referred from thermal-sensors[0])
arch/arm/boot/dts/qcom-ipq8064.dtsi:232.19-250.5: Warning (thermal_sensors_=
property): /thermal-zones/sensor9-thermal: Missing property '#thermal-senso=
r-cells' in node /soc/clock-controller@900000/thermal-sensor@900000 or bad =
phandle (referred from thermal-sensors[0])
arch/arm/boot/dts/qcom-ipq8064.dtsi:252.20-270.5: Warning (thermal_sensors_=
property): /thermal-zones/sensor10-thermal: Missing property '#thermal-sens=
or-cells' in node /soc/clock-controller@900000/thermal-sensor@900000 or bad=
 phandle (referred from thermal-sensors[0])
arch/arm/boot/dts/qcom-ipq8064.dtsi:52.19-70.5: Warning (thermal_sensors_pr=
operty): /thermal-zones/sensor0-thermal: Missing property '#thermal-sensor-=
cells' in node /soc/clock-controller@900000/thermal-sensor@900000 or bad ph=
andle (referred from thermal-sensors[0])
arch/arm/boot/dts/qcom-ipq8064.dtsi:72.19-90.5: Warning (thermal_sensors_pr=
operty): /thermal-zones/sensor1-thermal: Missing property '#thermal-sensor-=
cells' in node /soc/clock-controller@900000/thermal-sensor@900000 or bad ph=
andle (referred from thermal-sensors[0])
arch/arm/boot/dts/qcom-ipq8064.dtsi:92.19-110.5: Warning (thermal_sensors_p=
roperty): /thermal-zones/sensor2-thermal: Missing property '#thermal-sensor=
-cells' in node /soc/clock-controller@900000/thermal-sensor@900000 or bad p=
handle (referred from thermal-sensors[0])
arch/arm/boot/dts/qcom-ipq8064.dtsi:112.19-130.5: Warning (thermal_sensors_=
property): /thermal-zones/sensor3-thermal: Missing property '#thermal-senso=
r-cells' in node /soc/clock-controller@900000/thermal-sensor@900000 or bad =
phandle (referred from thermal-sensors[0])
arch/arm/boot/dts/qcom-ipq8064.dtsi:132.19-150.5: Warning (thermal_sensors_=
property): /thermal-zones/sensor4-thermal: Missing property '#thermal-senso=
r-cells' in node /soc/clock-controller@900000/thermal-sensor@900000 or bad =
phandle (referred from thermal-sensors[0])
arch/arm/boot/dts/qcom-ipq8064.dtsi:152.19-170.5: Warning (thermal_sensors_=
property): /thermal-zones/sensor5-thermal: Missing property '#thermal-senso=
r-cells' in node /soc/clock-controller@900000/thermal-sensor@900000 or bad =
phandle (referred from thermal-sensors[0])
arch/arm/boot/dts/qcom-ipq8064.dtsi:172.19-190.5: Warning (thermal_sensors_=
property): /thermal-zones/sensor6-thermal: Missing property '#thermal-senso=
r-cells' in node /soc/clock-controller@900000/thermal-sensor@900000 or bad =
phandle (referred from thermal-sensors[0])
arch/arm/boot/dts/qcom-ipq8064.dtsi:192.19-210.5: Warning (thermal_sensors_=
property): /thermal-zones/sensor7-thermal: Missing property '#thermal-senso=
r-cells' in node /soc/clock-controller@900000/thermal-sensor@900000 or bad =
phandle (referred from thermal-sensors[0])
arch/arm/boot/dts/qcom-ipq8064.dtsi:212.19-230.5: Warning (thermal_sensors_=
property): /thermal-zones/sensor8-thermal: Missing property '#thermal-senso=
r-cells' in node /soc/clock-controller@900000/thermal-sensor@900000 or bad =
phandle (referred from thermal-sensors[0])
arch/arm/boot/dts/qcom-ipq8064.dtsi:232.19-250.5: Warning (thermal_sensors_=
property): /thermal-zones/sensor9-thermal: Missing property '#thermal-senso=
r-cells' in node /soc/clock-controller@900000/thermal-sensor@900000 or bad =
phandle (referred from thermal-sensors[0])
arch/arm/boot/dts/qcom-ipq8064.dtsi:252.20-270.5: Warning (thermal_sensors_=
property): /thermal-zones/sensor10-thermal: Missing property '#thermal-sens=
or-cells' in node /soc/clock-controller@900000/thermal-sensor@900000 or bad=
 phandle (referred from thermal-sensors[0])

Presumably introduced by commit

  88542b1d37dc ("ARM: dts: qcom: fix thermal zones naming")

--=20
Cheers,
Stephen Rothwell

--Sig_/ptewabXvebv++qFXSo5WEGI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF17AIACgkQAVBC80lX
0GxoEwf/fn/n1scMNoeWIs05v3eN++jpoPOzqcnzSBh63aoy7Q2N9spoacvpemDs
kzdvpxDcOT4ZZOnziCBlgW6Hn09+IqGXQqwBNe5qm1379CRMkdj7/r802dN5TqJ2
OitVj+vKKUTMIAHPqxuoZzOw5JJjLDdxuQPqxIM3WuV2ZfAa4HP6TSm/DwNfW5TM
0PRTyDn5r9UGirBwNq1EcN4RkAlSCZG5eYGViWbIuhVGiuBZZLjONKSI21t9Tp4+
cYdlN2ejWdECkwARvKclhQZ/uVNxzNsUakSSZXHX0ZyOJpIyWtUH1+DER29+Kv0R
Mb1jAWkKXMpQsjXpDJm3kmob/X+hRg==
=ThRZ
-----END PGP SIGNATURE-----

--Sig_/ptewabXvebv++qFXSo5WEGI--
