Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0090C43A5EC
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 23:32:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233868AbhJYVeg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Oct 2021 17:34:36 -0400
Received: from mail-mw2nam12on2080.outbound.protection.outlook.com ([40.107.244.80]:59104
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233394AbhJYVef (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 25 Oct 2021 17:34:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EzFzh4vESQdkrZviS7FP1hHaz6AJWZwTDdqZjRVWPiUtrZgc0j8Ek1zySOiZG9dtvG71Mz3fJn1J7smrsEqvzd7Cbz87FBkbA9WcQF7xpEUk1MYldZQjJ8V52i7vawrL72aCLFNCrwlwk64HCr50ndDyT45jSPbzTDkefYe7Q7Cv4mQmCcQGO9K1SArgP7dpqAX9SFZ48ms2cvnHYhUMzaw0VcPRxYnHDmbWoUbcede4N0st5nbaR6WllLRr670FHas1urlG3E7taOmxydHpaHmt4Dn1Fjz31V3UtdxDclXJ7+1pXAUCWu81Yg/acHDfVVdCpdDhNBlhM69XZryHxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ooSBaNqj5BVwCm/UEXpbUtarGKYIcjOQgJaEbBueaI=;
 b=CnSljsFOVx1+XSVyMEj+3v+SSH2Oj1SU5xnuejIUOIwGTimbufijjH5h+v6AZA9+bHVqxccIBqF/kNlcUGR7NRwRczonyA2lCRt9IdfDMR5pKW1y1u/B87vb9guZma4mApZZtGcfghYNzowzgmMkG1xvjiAV9fNWAqyMHjEUYP0n3nL1yU93H9vk42jsu+aeH370aip5emE6DTl6G7drH0lZwfhbKssLBORtCU5DvDPHk7oniWKUoMkRj2meGTwpjUHAwaWIabsJIn5leIRdBzaJjMVVVEpj9FVnDwbt1G+VercBM4VmFKoJbbh/LVN1MYuQc9Pd4DP8PKTW/u4K/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ooSBaNqj5BVwCm/UEXpbUtarGKYIcjOQgJaEbBueaI=;
 b=V5Kk193fsOJF16icsCCjSpYCYuBnB4my9d6l2OGo+fm6nb3gOPHqQFjNymstnsq5gtMX+yk3Fcl2ZsRvuy66Fqp6eOo5qRk82l/tRNLYayO50/oZ0Os9WkCnHszN1iygBZfuwoDoIAbX0r04wI1j0HMpKhNdUmS9LUpwIafRMdA=
Received: from SA0PR12MB4510.namprd12.prod.outlook.com (2603:10b6:806:94::8)
 by SN6PR12MB2829.namprd12.prod.outlook.com (2603:10b6:805:e8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Mon, 25 Oct
 2021 21:32:10 +0000
Received: from SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::f909:b733:33ff:e3b1]) by SA0PR12MB4510.namprd12.prod.outlook.com
 ([fe80::f909:b733:33ff:e3b1%4]) with mapi id 15.20.4628.018; Mon, 25 Oct 2021
 21:32:10 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>
Subject: RE: linux-next: Tree for Oct 25 (drivers/platform/x86/amd-pmc.c)
Thread-Topic: linux-next: Tree for Oct 25 (drivers/platform/x86/amd-pmc.c)
Thread-Index: AQHXyediiECcnpRJtE6QgiC/REsYH6vkO3IQ
Date:   Mon, 25 Oct 2021 21:32:10 +0000
Message-ID: <SA0PR12MB451081DCA2B973935FC1CF03E2839@SA0PR12MB4510.namprd12.prod.outlook.com>
References: <20211025204921.73cb3011@canb.auug.org.au>
 <af7d7b8f-45fd-53c5-a8c4-1f594a16111e@infradead.org>
 <92c26aee-d3eb-258c-a0dd-e09783db6a20@redhat.com>
In-Reply-To: <92c26aee-d3eb-258c-a0dd-e09783db6a20@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2021-10-25T21:32:08Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=961485db-cc67-4e06-80c8-dcd756dea885;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 34844d9b-6fdb-4a9e-aaca-08d997fee713
x-ms-traffictypediagnostic: SN6PR12MB2829:
x-microsoft-antispam-prvs: <SN6PR12MB2829BA278B7412F30AA6ACFAE2839@SN6PR12MB2829.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KwEUv6r45F0kltPNjpni3mPi3RFyUW/qtY6HhYZMeqL2RNs1oJKF0TUcYDpI20eVh08dH4mJkZIkvRAtqUd2Ta78tZbb1bDpxKxgqnJxG4WRLiVURCPXTNZy+xy9rLDb9sfhAlTz5VTwT5ml+vFAWpcLLjujdu9UpZ+Zl54G9j7ZIqz2AlWrZSeYCNzIEYIFL+F4TrUS+8kHdd5NLZYasHikv/ZVly5JTQijrkdz1m3X++Unx3SyI3fxCaw4gXOkxSUS+lRjUZ3VmpngCxSOcavKubjr7wucca4NOgpTs9F5HyLjpkFhcqjlL8xySf/Ue/DCNCr1A8+nIn89BjjQfxVmcBZiaA6aEnkjvuV9NZb0FysoIJzClcgV+JkwwPK20o77jawPFg+Z4+g0hyI+JQCekZvWPI/yldjCqIQIeCt0sgRSidCXqv6vI7sGdHKfxKIeDW1zqAWz6GWZz7hSaQUhUnt/SmZdV3MGqDembYISZgV/K7xI/03GRVdg6onWoBMSQiJI0Lie18Q7VCm6MXqK5KOpMSCBa57i/2B2017QIpIzhkPu53ZcfekYEGgT20hDYZrXL2YD48yQfx4Im3maCp3ew3J0DooH2D6ep5w4iZWT0ohGvCNS6yc06Sk9TSuphf/Bwiy5Jo3udO0iiyBbJ4E1v53qp1kDD2FDn4HPcsGL7qrOnSqrGb3pQLOt4TxwjZfZY5NZDGuKpDbMLA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4510.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(110136005)(5660300002)(52536014)(38070700005)(66946007)(122000001)(64756008)(8936002)(54906003)(66446008)(66556008)(186003)(66476007)(9686003)(33656002)(7696005)(508600001)(8676002)(71200400001)(55016002)(53546011)(6506007)(86362001)(4326008)(76116006)(26005)(316002)(83380400001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGR4YjN5dGU5Nk5HaWhtZmhFR21rRGFGYnMrSS9rNlBCOHN0OCthdDA1Z0pJ?=
 =?utf-8?B?ckFNVU9EYk1CdVRHY0QrbVFjRUZEbytvSTdYN3ZnQytlZ0Q0TXZmWDdSUmpx?=
 =?utf-8?B?MFcrRHg0ekFpeS9yUmdHdWE3M1NDa1IxcGpOdkxWbk1LUk9SdDlnN0FuMEhx?=
 =?utf-8?B?SkdxWVR5a3hxbzEvOEJTam1CYVZlcjJzWm9DL0I1azh0UEFNS1NMOU5zS1lM?=
 =?utf-8?B?YlZhVW1wM2JORVgxazVvbGRrQi8yL0t5TGtUd0tHWUdUM1QvTllUd0hENTdp?=
 =?utf-8?B?Q1FxaEpWcjJXY09Lci9zdWhscGRmck16Y3FaN0NiYUlPNE92bUQyM3V0RVU0?=
 =?utf-8?B?V1NWa2ttSURBR215ZDhJdkZuNlZPWE5URWxyc2dCNzR4RXNTMDF3V3NuZDNo?=
 =?utf-8?B?RzFuYko1dlVValRHK0YvUWFkRUJiTXJ3ODFtMTE2QzlreldLTFVFUncxRDVo?=
 =?utf-8?B?MlEyWktxTnNtWnF3cXI2Qkg4V3dsejh4T3lGWkVGNG01aDBscGtEQXU0Y3g0?=
 =?utf-8?B?elJ4VHJxNnFheWNjZmd5RFY2bkRSVG0zSHZKSEw3LytBK0lITVI1OTBMOVFN?=
 =?utf-8?B?bU9pWHIrejltK2dHbm9kc3VuUlRnZy9sNytZTmRvSC9iUy9EUnM2aWIwc2pD?=
 =?utf-8?B?NmZva3Vrb05KckFXM1Y2Z1NlRFVLRjlhVnMySnpGV1V5eGswQmdkTk9SMk5V?=
 =?utf-8?B?ODhiNm1hVFQyd2VXY0dXcyt3TUMrS1dMNTBNYUJhTW9CWEdrcjlydGVrZ1NV?=
 =?utf-8?B?enJsUHZmOWkzZjRhSlVxU3p2V1IrQkJ3KzBzQ2dFWm1iTFhkNElydDlIeWF5?=
 =?utf-8?B?aWZmL3RuVStRZjdlSXNJa3dmY3BYRFAyQWhsRElZRFdaQmRRc0IrR1RIZ2JO?=
 =?utf-8?B?eE1qK29iUVhYbXRMb1RIQ1pHazN0NlNTRnRDd2x0VkJ6N2wvZzlTNlVVMnN4?=
 =?utf-8?B?WG5pYjd1KzF5SXdvSjE2YisweWh3R3RhR1czSXpweDRLS2phY25KcGRrc3Vn?=
 =?utf-8?B?elU0cHNKMWdJOENxZStHYTZUVTJzbmNNZTVqZlQvN05qVkNsRXVMUjB5WHZo?=
 =?utf-8?B?dWpBclo2dVFXZkczbnpxWXNRbDhUY05waUxCMWlkUXBUb2pnWGhjMTVaeGtS?=
 =?utf-8?B?VmJXSHZQT2RoTmc2SkpGWGdPZ3Z0UGw3eGYrNzhRWEVyUlZnUThURW5mVzJ2?=
 =?utf-8?B?MTZRNGszTGRCczRqV2szVDlkZmhZaExiQzNjZ2JMT1FRR29ieU9KU2hCbkVR?=
 =?utf-8?B?UDdPUnVnYW1sb3ErRTlza3VSaGx2VkVFYi9LZXZJdkN4NjdoT1RYZE5FMUEx?=
 =?utf-8?B?M2xWWUhlWkozSGtiVkg4eDJadkVDZnYwbCt0cHhuUkJlS1dERlBsbXhrNitZ?=
 =?utf-8?B?cFNBdDM2VFFVa2pSa1pKZkpGT0hoanpZdGpTQTVmVHU5aUpMWHhlcVB2MGFn?=
 =?utf-8?B?YXZveUYxTmRNWmdFandNNXRZZlR4bXFrQnU4SDlwZUZ6dmZmOGZtZ2xQYTdX?=
 =?utf-8?B?cjNyVmxNc2NvbXQ2aVovcnNWTHZ6YWw3amF2STcrSUNCb0xNTEY5RHEzNito?=
 =?utf-8?B?Rk1sUGdSSExlZm5YNFN1bURvelpWVmJQdGZOV1lqejg1clhBcGpicVp3YURU?=
 =?utf-8?B?S3FJZklVTG5VQ0NRNjdKamtMeVdQUW84NFIza1hIWFdkZUNWZ2ZGNk0yRXdo?=
 =?utf-8?B?R2VpMEtXTjBTWWpFN0htY29KWGhoL3paamxLNzE0RXQxTm1sQjJGYmtYL2RF?=
 =?utf-8?B?c3E0NXo4azZUU3hlZFdnMWlORFVRSzc3SUk4VU9oNVcwTzV1QnpObHZqMW0w?=
 =?utf-8?B?NWd0K2JGUjB2UEFTdk5RWGFKM3pDNUhZNjdSSjBHMVQwNlFwczZ4aTBMK3hL?=
 =?utf-8?B?blh1TndTZmRGVkprVEVLemwwNXh1SzFxWjJ0T2xSYnd2dVA5bDJBRzBFYkJv?=
 =?utf-8?B?MzNDbys3Q0gyQ2h5T3U4R2Q0dHlwWlBxWGVBTlRPOWNIZnRyY1VRMzJMY2t1?=
 =?utf-8?B?aHVHdlZuYlJQNVpuUllrSGovQUJ5eTVaRWFyMlV4eW1uUGUzSWdiUmJlQjhp?=
 =?utf-8?B?ZFBsSzlPblppaUdNelJvUHZUclBLdjIrK2VOVzlRaU1vam9LTkQrKzVKVXE5?=
 =?utf-8?B?NE5MUTV5c01samZiTTZqSmFjK3l0N3kyTnRRNFpTNlhsUHBhWGN0QmY0eXZ0?=
 =?utf-8?B?SVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4510.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34844d9b-6fdb-4a9e-aaca-08d997fee713
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2021 21:32:10.2804
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qCPcTozhlw4h/Z99iKpJmMEb7JSazt87wGA8qJyezW4BcbW7L3KFevBFsnoolpeS/xkAwyeL3Qwe3BK92xjsew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2829
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

W1B1YmxpY10NCg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGFu
cyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4NCj4gU2VudDogTW9uZGF5LCBPY3RvYmVy
IDI1LCAyMDIxIDE2OjI5DQo+IFRvOiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9y
Zz47IFN0ZXBoZW4gUm90aHdlbGwNCj4gPHNmckBjYW5iLmF1dWcub3JnLmF1PjsgTGludXggTmV4
dCBNYWlsaW5nIExpc3QgPGxpbnV4LQ0KPiBuZXh0QHZnZXIua2VybmVsLm9yZz47IExpbW9uY2ll
bGxvLCBNYXJpbyA8TWFyaW8uTGltb25jaWVsbG9AYW1kLmNvbT4NCj4gQ2M6IExpbnV4IEtlcm5l
bCBNYWlsaW5nIExpc3QgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+OyBwbGF0Zm9ybS0N
Cj4gZHJpdmVyLXg4NkB2Z2VyLmtlcm5lbC5vcmc7IFMtaywgU2h5YW0tc3VuZGFyIDxTaHlhbS1z
dW5kYXIuUy0NCj4ga0BhbWQuY29tPg0KPiBTdWJqZWN0OiBSZTogbGludXgtbmV4dDogVHJlZSBm
b3IgT2N0IDI1IChkcml2ZXJzL3BsYXRmb3JtL3g4Ni9hbWQtcG1jLmMpDQo+IA0KPiBIaSwNCj4g
DQo+IE9uIDEwLzI1LzIxIDIyOjUwLCBSYW5keSBEdW5sYXAgd3JvdGU6DQo+ID4gT24gMTAvMjUv
MjEgMjo0OSBBTSwgU3RlcGhlbiBSb3Rod2VsbCB3cm90ZToNCj4gPj4gSGkgYWxsLA0KPiA+Pg0K
PiA+PiBUaGVyZSBzZWVtcyB0byBiZSBzb21ldGhpbmcgYW1pc3Mgd2l0aCBjbm9zb2xlIG91dHB1
dCBpbiB0b2RheSdzDQo+IHJlbGVhc2UNCj4gPj4gKGF0IGxlYXN0IG9uIG15IHBwYyBxZW11IGJv
b3QgdGVzdHMpLg0KPiA+Pg0KPiA+PiBDaGFuZ2VzIHNpbmNlIDIwMjExMDIyOg0KPiA+Pg0KPiA+
DQo+ID4gb24geDg2XzY0Og0KPiA+DQo+ID4gLi4vZHJpdmVycy9wbGF0Zm9ybS94ODYvYW1kLXBt
Yy5jOiBJbiBmdW5jdGlvbg0KPiDigJhhbWRfcG1jX3ZlcmlmeV9jem5fcnRj4oCZOg0KPiA+IC4u
L2RyaXZlcnMvcGxhdGZvcm0veDg2L2FtZC1wbWMuYzo0Mjg6MzA6IGVycm9yOg0KPiDigJhDT05G
SUdfUlRDX1NZU1RPSENfREVWSUNF4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1
bmN0aW9uKTsgZGlkDQo+IHlvdSBtZWFuIOKAmENPTkZJR19SVENfSENUT1NZU19ERVZJQ0XigJk/
DQo+ID4gwqAgcnRjX2RldmljZSA9IHJ0Y19jbGFzc19vcGVuKENPTkZJR19SVENfU1lTVE9IQ19E
RVZJQ0UpOw0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fg0KPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQ09ORklHX1JU
Q19IQ1RPU1lTX0RFVklDRQ0KPiANCj4gSG1tLCB5ZXMgdXNpbmcgZWl0aGVyIENPTkZJRyBzZXR0
aW5nIGlzIGEgcHJvYmxlbSBzaW5jZSBpdCBpcyBub3QgYWx3YXlzDQo+IGRlZmluZWQuIEJvdGgg
c2ltcGx5IGRlZmF1bHQgdG8gInJ0YzAiIHRob3VnaCBhbmQgdGhpcyBpcyBhbHNvIHdoaWNoDQo+
IHN0YW5kYXJkIGRpc3RybyBjb25maWdzIHVzZS4NCj4gDQo+IE1hcmlvLCBjYW4gd2UganVzdCBy
ZXBsYWNlIENPTkZJR19SVENfU1lTVE9IQ19ERVZJQ0Ugd2l0aCAicnRjMCINCj4gaGVyZSB0byBm
aXggdGhpcyA/DQo+IA0KPiBSZWdhcmRzLA0KPiANCj4gSGFucw0KDQpTaHlhbSBwb2ludGVkIG1l
IGF0IHRoaXMgYW5kIEkgc2VudCBvdXQgYSBmaXgsIGJ1dCBJIHRoaW5rIG91ciBlbWFpbHMganVz
dCBjcm9zc2VkIHBhdGhzLg0KDQpUYWtlIGEgbG9vayBhdCB3aGF0IEkgZGlkLCBidXQgaWYgeW91
IHdvdWxkIHByZWZlciB0byBqdXN0IGhhcmRjb2RlIGl0IHRvIA0KInJ0YzAiIHRoYXQgaXMgZmlu
ZSBmb3IgbWUuDQo=
