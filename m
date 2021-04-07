Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BDF135799D
	for <lists+linux-next@lfdr.de>; Thu,  8 Apr 2021 03:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbhDHBmt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Apr 2021 21:42:49 -0400
Received: from mx08-001d1705.pphosted.com ([185.183.30.70]:54914 "EHLO
        mx08-001d1705.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230301AbhDHBmj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Apr 2021 21:42:39 -0400
X-Greylist: delayed 8280 seconds by postgrey-1.27 at vger.kernel.org; Wed, 07 Apr 2021 21:42:38 EDT
Received: from pps.filterd (m0209321.ppops.net [127.0.0.1])
        by mx08-001d1705.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 137NLKe9028762;
        Wed, 7 Apr 2021 23:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=S1;
 bh=v7uA8EQunyHRMLBqQT0MO+v6/JxBIG0QOidiELDcQyA=;
 b=SWXxwOi0sMh0nuojZ3ihJHyfh1Q2j8L7/OliVC4wuYzAKMwy5VVojZnUdsNND/31nSB1
 xtVhHy5jh3LmkXWxZiE1epFgSGBlqzssk5eJTGjMTVoGPfJlczoT+3t7t67DiuQ/wJPc
 e3dEzEMCQGKPpI4/rWa5+eMqwFE6cGNOXHPGALelwy1NyY8ats+/OdgbnJoFMaNkt6eb
 eATYiJstl7o2FNLl3tRrhEsj94K64yOAOSu0ZZD98zcVlqjG/ccmvcpDcOE85bFJZzC7
 snluhJCk+jXU5z6mkYFXWzVra0vbvzTNtjJZsshaKCmLrBhmIYUwbvT/pv1+Y3ViEUnQ LQ== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
        by mx08-001d1705.pphosted.com with ESMTP id 37rvb1b2w7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 07 Apr 2021 23:24:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hSb2YhGJNMBeRdKy2XYM1yrLdf+SiHBlMqs8YXLPI6Ke/lo7HSFdVNRzTzloFUmW0WQKKLl3QbsADFBXlEDdyBG3PGWGElNGCakThjmL2TvqTEm4BCv3DEeHH9l93R6A7qbbVjCx2RhugifNJ20Hh92Fr+RHgdls2+8Or2TtDTSWhaEbglWro5anSeolt6tMQWxKJxxRZw6z9N+Youegr3nsD0K9HKgYJexp7Hj1vf46QZa3I0xpZuB7pq+op5ApShu6uRODGV4RZUW173dPBjysjz8xsDSdcbeMpBuyCbShljmfd10VnNdYoQFk3q22/cP/b5kFCgJWnY1TwmhW7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v7uA8EQunyHRMLBqQT0MO+v6/JxBIG0QOidiELDcQyA=;
 b=m/Rh9m4OBW/uHvQsYh1rnL+PqveiLkSY6enNs86YPjarkm1WUv50ZuzgmFlcrryikguIYQ+5yG1KLpzP2aGDoZVoQjmFRM2klnfPKQeumbLAmH8jl0KbFudmImU1EWtRoFszVCQOh7Qh+VO7hQ1MtkUqBgCufM+W1p/GyZxWd8apfQoeyNPaoPdUkF+ebW2jGLee17KUFmcOGVzudN/aop7RIJr+2CLbVH215WvMbIfXLps99CuAQSP0MBleVcqfJfapwE9B/h3ZAx9Cl9JzmGWFwP7AasNDYZtXmPygGYBfBB+mUFrRKyfQXSpngfecVeY8prmT0jcLEiD/DrtkNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from MN2PR13MB2832.namprd13.prod.outlook.com (2603:10b6:208:f1::30)
 by MN2PR13MB2958.namprd13.prod.outlook.com (2603:10b6:208:150::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.8; Wed, 7 Apr
 2021 23:24:15 +0000
Received: from MN2PR13MB2832.namprd13.prod.outlook.com
 ([fe80::d03e:4c15:4dc4:1fa9]) by MN2PR13MB2832.namprd13.prod.outlook.com
 ([fe80::d03e:4c15:4dc4:1fa9%7]) with mapi id 15.20.4020.008; Wed, 7 Apr 2021
 23:24:15 +0000
From:   <Frank.Rowand@sony.com>
To:     <sfr@canb.auug.org.au>, <robherring2@gmail.com>
CC:     <linux-kernel@vger.kernel.org>, <linux-next@vger.kernel.org>,
        <frowand.list@gmail.com>
Subject: RE: linux-next: Fixes tag needs some work in the devicetree-fixes
 tree
Thread-Topic: linux-next: Fixes tag needs some work in the devicetree-fixes
 tree
Thread-Index: AQHXK6Efb/oHFxxe/kO2akQql5S+lKqpsk3g
Date:   Wed, 7 Apr 2021 23:24:15 +0000
Message-ID: <MN2PR13MB283296F15263550CD8767079E1759@MN2PR13MB2832.namprd13.prod.outlook.com>
References: <20210407212522.6cd49dc0@canb.auug.org.au>
In-Reply-To: <20210407212522.6cd49dc0@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none header.from=sony.com;
x-originating-ip: [107.77.235.219]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f153a458-1499-49db-78a6-08d8fa1c428e
x-ms-traffictypediagnostic: MN2PR13MB2958:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR13MB295897E05C2E42581542698DE1759@MN2PR13MB2958.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:227;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9dKKlWA2mTOn9d6OM8eIOP+yLtjJBNejXoF1afqnaZmMXChCpc0QrSBI0xyMURiO7rn2jjbL1QzuM40XbpHCcqdvtYQ6KQn4sotwcvs9HhbwZLKfLgsQqpuSdxBOIgGpd6e0FowYZ3vrtOUU7V6mf4+pa1rvVjOFyS0wKR8v1ZajGa89XaTuJGASXGaZ1A2dxbmbGcgA6kQhUhPQKcNU4yp6rVawPre9f6hGKHCS6MiwhKLOk+KHTdyOzaWe7lkcdTvAfqqGhgRC4nHVcFX1me+JpNe3+IHbjsLfywL/1BoBJb4p0viV3+AZlacRnW/3PfUwYGT/H7hcpNtxFOkwt1m3hVJw7Ay8lgASYUtA+Vb084iEa8SY+GZsDtPTG8j22D9RzNIr6W+j1y915hshuFY2zmk6tujnBQ49pI9uGcokEKIxcWtORZffuiBczQweNx4gC9UZByWVqa7fX1J3vx7OAp+8kT3Yp+8xjMdJUkGVgtaMEDev1wk4JZuGPvW5IfsKcU/8oWTxWTaFrnTNzThSELeaYdjXejrwj6hmY51MR9BcdfnKzPW0SUMWBPHJrKmuZ5eeSliBcM4zk/hwd9L7vxVLJnVvMidgX0NUckj2b/JW5aKME7DucBKcgxyBVGMhswW7TGknZqAyJPLrJDzCutTcWvskFZrIdyec0W4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR13MB2832.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(83380400001)(55016002)(4326008)(8936002)(26005)(110136005)(54906003)(316002)(186003)(9686003)(478600001)(52536014)(66476007)(66556008)(64756008)(66446008)(66946007)(76116006)(8676002)(2906002)(86362001)(71200400001)(6506007)(5660300002)(4744005)(38100700001)(7696005)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?LDnBIUYdGRHQ0xHFAv/iryd/72oRz6QPeO2fQZPY9/ENWjEmBanSP1R1bWjb?=
 =?us-ascii?Q?oFO68piI39qNTmBr9UhF6xznR6grpwEQhE4cHgfkm5BkC0CPhr1ZbzLMqHPw?=
 =?us-ascii?Q?mdRSxDjcInKzeUxrOzm6iqm9v7oky4orew7VfRg0uok+HyeQ1LH2x5xd0dNm?=
 =?us-ascii?Q?mtl3msCvnaAxlKO/AnBH7dOWRkVnOadVYZBbFSXW43oqiVx1SM26Gm5mXnI/?=
 =?us-ascii?Q?hBeKY98FXWd173LVgQKEnT2Ri4GnNEQ0N6vh6Iqg21pTXtAC5mVA0jmtFVUg?=
 =?us-ascii?Q?o5jJqkCNWhr9Un61KgFT7wXpCCep1ik2A0/McDX/9Y1CDwHP4iigB5dpnAVh?=
 =?us-ascii?Q?65k+9tTFonqIxHFyOIjB7oisWd6ljuImNxNjv7v1u1Rcoe0zJrNmFMK28+aC?=
 =?us-ascii?Q?swf53tvjq9NiqmzgKNOau3b4xxxL5T8l+2m2BziDnNPQDCSqlFYxaJY/Ch4P?=
 =?us-ascii?Q?cPwodmfFNDMfZFTXg4BMimQIEGIEoAhirK+vwyrq1zK9vhx/+rXmwTERVcvQ?=
 =?us-ascii?Q?ig7V6RmeFnslaxAGcQhoZes65GEC96Mik1mOdzCAqxl1Q90Z3Uehv4e7v5Jl?=
 =?us-ascii?Q?kdMHWgeWVUSyLzUIxT6YENa2qtZ1hoEzyrLVhpGi73dYgFhMnCL4idJW8qvl?=
 =?us-ascii?Q?S4altxqQK5n8NmtLICmbOaIFTnk77TE9pk8svPKrBBneg+/WU7hiz9Tre/mg?=
 =?us-ascii?Q?5XgWjDmL++/BVNbv5kUQHjm6bdYRy7ztTOYC//9YQs/yV4PvbmJ38ItBRb2v?=
 =?us-ascii?Q?+JbMLS0BH5FuyomWGpUmQvwHJ9vz6ZRbFdWu+hWYCrGJHtbiDn+drm0A2Lco?=
 =?us-ascii?Q?CGtH84jpDVbB5x+rB0DC5xm+5ChkGouFXTxBc8RieF/PbZGCwoO74AEFBNon?=
 =?us-ascii?Q?IDV41uKA4NeQLj6lHHNIOdXQW+4+DiOSJysg1kkUx2vPs5w8LgcjLGplmq3p?=
 =?us-ascii?Q?RZQ9qibhzXzRv1nCb+eAdQYnxqLqBmjAiHUfwrp4Vg29U4ygxQCbRch1v6Tv?=
 =?us-ascii?Q?RNokwQX/0mAkxDJ2Ckjc4d2a7ylsB0NB7u9hL+jxQLNTc6r8YsQpTflAd5Z6?=
 =?us-ascii?Q?Ny5UmpVGWNBi8x33BxNii1EY8mXktAgnyGTIoJFxDxxHkBYg/IZqLKv1y4Ii?=
 =?us-ascii?Q?z+G5GF/fbZh5JTl+CXDbcsEfWPXbYZA4QBpODO5EW9niexOSUz5CHi/YxLn5?=
 =?us-ascii?Q?7/veaiIMGqc6iuEA2e27ZWjb+C7O7pBYAdYz1J6+mVW6VIJS/kWejORoD/k6?=
 =?us-ascii?Q?bgUAYX8rfFYVZlMxoESRoeZDtIlaWz7c4ntqUHGmLWMmBJZBv8snmo2kC45E?=
 =?us-ascii?Q?BCRPb1NUxD67VWwoyKFkeg3z?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR13MB2832.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f153a458-1499-49db-78a6-08d8fa1c428e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2021 23:24:15.4187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fn1QjYJpVzR1PO5XfCgoOkA/G43OBqJIFAgBgaPsGzL+/1L1izmQUTmcV7XLuVA++sxZkf4zHOCng4MwI9sHDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR13MB2958
X-Proofpoint-GUID: pvQmU_vXtInGy9ppsP02hyA743ZMwDtN
X-Proofpoint-ORIG-GUID: pvQmU_vXtInGy9ppsP02hyA743ZMwDtN
X-Sony-Outbound-GUID: pvQmU_vXtInGy9ppsP02hyA743ZMwDtN
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-07_11:2021-04-07,2021-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 clxscore=1011 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104070166
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

> -----Original Message-----
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Sent: Wednesday, April 7, 2021 6:28 AM
>=20
> Hi all,
>=20
> In commit
>=20
>   f2ce9e97cf07 ("of: properly check for error returned by fdt_get_name()"=
)
>=20
> Fixes tag
>=20
>   Fixes: commit 79edff12060f ("scripts/dtc: Update to upstream version v1=
.6.0-51-g183df9e9c2b9")
>=20
> has these problem(s):
>=20
>   - leading word 'commit' unexpected

Sorry about that, checkpatch wanted "commit" in some other context and
I got carried away and also added it to the Fixes tag.

-Frank

>=20
> --
> Cheers,
> Stephen Rothwell
