Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC3353F1F3
	for <lists+linux-next@lfdr.de>; Tue,  7 Jun 2022 00:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231645AbiFFWGj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jun 2022 18:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbiFFWGi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Jun 2022 18:06:38 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F46F1EAE9
        for <linux-next@vger.kernel.org>; Mon,  6 Jun 2022 15:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1654553195; x=1686089195;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=RVtBY6itYWsqXZ1bg4klx2X6PSfAthHCK1M6AwNTTck=;
  b=F+xqtHWUgNBLd/OCBwF/r3UPLqFx1p0wogN/fyxegdA32j44aAUc3tAY
   Fad3WkncwLeoYv/XBx35IIsbHVP/uc8zaFVMgiE2R64Q2ysOfxkMdBzJk
   0kvOwetOz3RfQESlegdo/riFA2cCvpoSamf7NMcL/ZT9H1pJ3+cZ8ml/M
   b/lyX40wJkYGtRttsWCtuhn+ya8/Pc7aOgHOuXsfBuO8ocjhCJiYQ7xGj
   ViwsweauKzqYzOZDb5MoxvT3auZsuM2ZcCYNbNsf2BifqQVOaGafHoPgJ
   p9yeA1ix6fJL5Yv7HabGNdyTXzhhW5TwBNVdJDVB8LcHpNKZMeokMuKXh
   w==;
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="176771000"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Jun 2022 15:06:34 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 6 Jun 2022 15:06:33 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Mon, 6 Jun 2022 15:06:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y6R5FtQ162gT+oRLpxzjJgCSAyD8zwDIeFcpqqLMLh/DMYD5s1hYni2S8loLV2HJYs80GuiY7l0aYqvKph0+UB0oYW1plP+J/TiuXT/R3s8uFwab9gRum/auR4gGFqIv926QCVCSH+WTXjCy2//J/QJWgmygw/sJfD5RDEFXVjya6c0OfGJJJ9Jp7vAGIpC5f7Nw6Sea5tZgtrRMhdzTOma5H47m4ebRARSI069BAFMuP4OjE3bnmwtJxHy+Hj3e4Mfo+i8Z6DJuTQXmSpNpkV1bWMtM6EG4OuOuC2UkTm5o9nVl6dN4k82LS7Em1tR5MJvpHYzg3U8leAH60uEd6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RVtBY6itYWsqXZ1bg4klx2X6PSfAthHCK1M6AwNTTck=;
 b=VBio78ZXxFx3UFmFVZu6RfulpAr4zO754nJH0Ny0OOfHdIukP0NiMStLO3gi1+Xs8CvuOQZ8HHlvg210fjH+qi9DEIXn/l1IW2Z6HE50fUiq8qi1Pb4w+U+8EBByoTkw2yEPaQqxXtOmB+z8GDsSjI9Z/QEQdpBiM7srqOc9om8YyFYbRvV5ezGLzxDhkcN/e8KBCRyX4EWsvTPYz034ggAND9GEsM0uT/rZc8XaSnVsJ9ZlL8tN0wsOIPBa87CZFEbepNmFtKa3RYO98KCGjlxwMYYJHIwx/w1JGyQUBpZZ7HJn6Tnsfag9azAwMiPlrFko2rf0Pm32HXx/J2gqHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVtBY6itYWsqXZ1bg4klx2X6PSfAthHCK1M6AwNTTck=;
 b=D66QFwRNU508YzIXAvqNnPoaLFo48E07Y9IJX+AIZaSmRmANstLML30Qc5YvPgCAq+4EhtzRDNow31/YNB8StcAnmPwhc9DiUct3PYt7nmagpppcwJym47Uf59ulHnQGHndTqbfm9cAQQMwJiAvSDjcfTTsw31IL8Au6LjLgsBg=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Mon, 6 Jun
 2022 22:06:20 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5314.019; Mon, 6 Jun 2022
 22:06:19 +0000
From:   <Conor.Dooley@microchip.com>
To:     <sfr@canb.auug.org.au>
CC:     <palmer@rivosinc.com>, <linux-riscv@lists.infradead.org>,
        <linux-next@vger.kernel.org>, <Daire.McNamara@microchip.com>
Subject: Please add Microchip RISC-V branches to linux-next
Thread-Topic: Please add Microchip RISC-V branches to linux-next
Thread-Index: AQHYefGmGrpMi2Za+ESP/Wott2kYNg==
Date:   Mon, 6 Jun 2022 22:06:19 +0000
Message-ID: <5ecd9c16-ce86-3666-3c2d-a14218659d79@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de077bc2-4a29-47c0-4e47-08da4808c926
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_
x-microsoft-antispam-prvs: <CO6PR11MB560226A4A80DC0E634114FA698A29@CO6PR11MB5602.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DA+YwYxuBsie7R37q/TlmDL3g0E8r1X4pWGeSHcSPqnnYxM31jqng2Y4IXSPP8HXY2SJJp8d+PN4VkY1+PpmygHeIOH/KB7+PeWbLKs9BWQ+HZPhv+d1A8Dlt6FC0yN8NbB68PMYY34Dfx00patm7WGEvxo3Fkqw1yfLMZmPjeHUMxdWvCkuSb9kfdzJ7lBE1AXbECtVXWm74oaiZjHIQgzBGLHv2jiauntvucup/saIRQthX1pMjcuBL9RlkgFxqsesfuSTu1FgncVYDegWxVRC7tW0+NnQ0TBkkyBw/4DfgBvdniJXBqi9HM3+yHAqhdP3wDk1f/7/13aY7pB8aJUuwJjiwRYHOZSghzBHlMd6hzLWFaI5ilcv+lvoQgl/PWbOc0xa3HAasPn89e5ztf0WlIme8FLDtfnqUAL49bbcdRIIEhg4O1OyV1OAQ3EOGQHcaj438Ri3wsDWzsonKI5waUhsEv+DhyfWca7efBhK5m8YoJMaRlB95+Jzju/9kgQfgi/NcPRktg1GvbAXAI5DF6Alueno2lK83Obb08Z7aiCi0gDkD1HDUgU9iN5Hk9sNWm/jDMeEjoILJjUNeTvUoTajwLRATSq8yk/Dk3kS0QUbo6FhKueMaYfVP6+bjZT0u6DDPO6yQNatGqJ0ZMP444pO5spWs+wWbHY1UGCWjQgscyKoRiBbs9egy2+GdEm03wVav/HcWe7CR4hQdwHivEr1Qo8L6IjKkhQcnrqq29PX+jWY7jDaIgV8WqeVWtn2zNnO6TTgM6D7ossy/k+iIBYPcc94v2Dud44QBqIckwGzPWWOyvSVG7ukv/Z0Gi+WsRQIYr2RHYZIAN4Xyi6UdIR1SlDJOIj9hqwbvrgDPQYFuCBNkh+4X2M5L/ES
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(38100700002)(8676002)(76116006)(5660300002)(31686004)(91956017)(4326008)(66946007)(66556008)(66476007)(66446008)(64756008)(107886003)(4744005)(122000001)(6506007)(6486002)(8936002)(54906003)(6916009)(38070700005)(316002)(26005)(186003)(83380400001)(2906002)(508600001)(36756003)(71200400001)(2616005)(966005)(31696002)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dmZiVVUyODd5SUl4VVR0ZE5TQ2k4WUNYdkw2WVE0R2x4dHd6bnpHVXd2WGRx?=
 =?utf-8?B?WFJjUDZHTkxOdmpjcXdCOVAxbWthakdSZ1ZCaFhMLzFFQy9mbitIbU1aeVB1?=
 =?utf-8?B?TXNqQVl3bU1sMzYzU1pPc0lOUTVKU2RwVi9lSkU3aHVQbzQxS3htK2VKSk05?=
 =?utf-8?B?NDFVamNNVEFVMHhkMTJqdVNUd3ZoSVA1YmdKOXJaR0NOOWRqMVE1ZWlFRllG?=
 =?utf-8?B?MVRSQXU5emszRksvcFhrMGRQdDUxcEcxbUdvUXNtM0FqaTdGV2pvSFdXTlBy?=
 =?utf-8?B?Z3Z6VjVVcFh1Y1BlQ2FtVE9xTytnd3ZvMnV1VkZPVWRPU01BUlVFck82YjNs?=
 =?utf-8?B?STNhK0tudURVRHZXbnRFN1NzdzhQSVZTVVI0S0xFUzRoL0xvc3hmM2p6Snha?=
 =?utf-8?B?WFJqZXltbFh2OWJYNnp3UEt1S3ZBVFp6ZGhSTVl4ZTYxN0w5ejlaRVhQY2Ji?=
 =?utf-8?B?USs2Mm1YbTRDZ2x3anc0RnR2Z3hwOXlieUhuSVE5am85ODFWTXNqUTNxakho?=
 =?utf-8?B?QXNDSkZKbFNpaVo2Q0MxS0t4KzJtekhsNWpqNWRmTEkwVzV2cnk3L1NCcE00?=
 =?utf-8?B?ekRyM1ZJR0UxYUhvWnJ2TFliMTU4WXpWZEJ1cVRuZlJxNlVPWVpjcGJndkts?=
 =?utf-8?B?MHVYRVNKcVV6K0xZOE1GSlN2TVl3SHJoUlFPV1BuY2NRdWhWaGRqOEIveEkx?=
 =?utf-8?B?THM4bWdEejlLMDI4UzRkeTBTYmQ1bTJYMEdTaXNGSFBVVHcxT09jQ2dhRVkw?=
 =?utf-8?B?c0Ivc3gzS0xwWGxqU3luTHZQN3JUNkpPM0kwRG1GNGd4dXNhQVNES3A5Mytr?=
 =?utf-8?B?ZmJaam1WTlFCdTIwWGlmMndmb3lwSll4bnJyS0Zsemd4YkZ1V1hOSjkyYkRy?=
 =?utf-8?B?MmcwbVQ4TXI0OFBtQVorWDR5SUtGSUtzNm96S0FOa0RMLzUvYWdkRDhYdXdY?=
 =?utf-8?B?d29vSGJMaVE1NmlleVBWa1VjSWk0NVdZK0JEdEh3Yzd6SWpydS80V2ltUzJi?=
 =?utf-8?B?MGNmL2Zqd0FjbUMzNFVxNmF1RW92bVdZNnIzQ0RBdkV2dzQ0Y2piZ1VSMTll?=
 =?utf-8?B?YlMzNEZ5bjhCNkdoZmdWRWg0NmhjUm1JSDc1OUV5Y29JZk8rTDRjcjhZd1BL?=
 =?utf-8?B?bDFGT0pXWFJob0E2TStBTDloWldTalgyVVYzQjBUWitvaHZEWlNOa2VKeGt2?=
 =?utf-8?B?NWtZME5OSGFZV0dCYUJEM1JrNHMxeXorOEduWTRTVFpZNEZyTEhQOWE2R3p5?=
 =?utf-8?B?TGlvVUpxbkI4YXZwZ29HcWxGS2hVUEF5N3ZvR3pham9Cd0U0bHk0NmxkVHdz?=
 =?utf-8?B?dkQ5TGFDOWdNN1prOGlrck10OUoxL1ozVmEvRFdrV29OcHA4bzZOZ2w5YmZT?=
 =?utf-8?B?dGczYVhQMXNRblBOZklZcEwyYlZ2cEZGYllqb0o5TGRIK25ORW5VVVNqRHIr?=
 =?utf-8?B?UlhvU3FwSWpRaFczemZEbGJwUlFhTFkrS3MzMExDanFQU3lqT0VadnhLNzVy?=
 =?utf-8?B?MUROaktoTFR5c2hsallieklXTGVBRDljQjZFT2FSL25oc2tZbyttN25mMkRN?=
 =?utf-8?B?OGhWb0UrQVBOc0hVMFJQNWJ1VW1DM29USnd2UlppZ2x0dWt4R1B3N0RvSFhD?=
 =?utf-8?B?eEVMcVpUS0NBTDlWMUhZQm11aXd3SDdCTEVwUW12Vm9rTHdGbjNQMFJ4SU5k?=
 =?utf-8?B?TUVVY2dJRFlpUWdkcWJuYWY1UGttZHh0VnBXM3ovOUtycGNTekFGTTR4Q0RZ?=
 =?utf-8?B?cjVlZldkNFhBaG56Q2lwMjZ1S0xBMCtKTmx4Rjd3TW9TZ0MyK21mYXloak1x?=
 =?utf-8?B?VU5US2dZUzJVS0xPMHFueVhXV2tic1V6eUw5WTlhcGMwRVkxcWNGRHlsZUh5?=
 =?utf-8?B?eHBwNFFRblplOEt3a3Zvdm1uL0NnaEJDbnIzZnBkSjNobjNJRTdmdjNEZVJD?=
 =?utf-8?B?Z1ZjbGw2R2t5NjBkb0tOclZaSk45K3MxcXFXeDg4N1dEMm1hbzJNUnNXK01s?=
 =?utf-8?B?Q1pLSkduUW9kdGVtUEJrM01jY25HK2M2MDF4dS9BNjlyZURwUGhkUE9ObXM3?=
 =?utf-8?B?eDd5V1ZLYTdqTnEyKzlacSsrbmI2NHpOY3pvY0p4eTM4OEt3MGZTa1pqUTE2?=
 =?utf-8?B?cGNXTWxSOFZNTGZ1YWtnWkVNdjRIYzN5YThZMlJjRDJXbXgwbWlJVE5NcDJT?=
 =?utf-8?B?ZkNtK1dWL215QnBLVGxUWFh2Ync4dDM1cmVyeVprWmF1Uzd4VDVMSk8wNEJB?=
 =?utf-8?B?MUV4aGp1cEthbERzdTNPZkxMTmJCWGxHVTNWblBTekRqSHZoRjhtZ0FPVVhR?=
 =?utf-8?B?KzNQdGtHSGxNaStMMXZMbXN1RDVic1k5STg0Wll4dUNScFZZZGtIN2o4Z3pj?=
 =?utf-8?Q?sMqKNycpnhGqLLuA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <230A9B14B8DBE94DA845264E6795F4B8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de077bc2-4a29-47c0-4e47-08da4808c926
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2022 22:06:19.7390
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ad8KxnPxWi0UZH4Ngqr3KO/igYS/V1SX/8MXhwCfhA10XbNcR1BSHYcrJDSovhIdDWDuT5cGwV00ESKwEl4ZDosxs3CXXN3FjOYbSOQSKWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5602
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

SGkgU3RlcGhlbiwNClRvIHRha2Ugc29tZSB3b3JrIG9mZiBQYWxtZXIncyBzaG91bGRlcnMsIEkg
YW0gZ29pbmcgdG8gc2VuZCBoaW0NClBScyBmb3IgIm15IiAoTWljcm9jaGlwIFJJU0MtVikgZGV2
aWNlIHRyZWVzIGdvaW5nIGZvcndhcmRzLg0KDQpDb3VsZCB5b3UgcGxlYXNlIGFkZCB0aGUgZm9s
bG93aW5nIGJyYW5jaGVzIHRvIGxpbnV4LW5leHQ/DQpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC9jb25vci9saW51eC5naXQvIGR0LWZvci1uZXh0DQpodHRw
czovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jb25vci9saW51eC5n
aXQvIGR0LWZpeGVzDQoNCkkgaGFkIGEgcXVpY2sgbG9vayBvbiBsb3JlLCBidXQgY291bGRuJ3Qg
ZWFzaWx5IHNlZSBhbiBleGFtcGxlDQpvZiBzb21lb25lIHJlcXVlc3RpbmcgYSB0cmVlIHRoYXQg
Z29lcyB2aWEgQXJuZCBldGMsIHNvIGluIGNhc2UNCml0IGlzIHJlbGV2YW50IHRoYXQgdGhlIFBS
cyB3aWxsIGJlIHRvIFBhbG1lciByYXRoZXIgdGhhbiBMaW51cywNCm15IGJyYW5jaGVzIGFyZSBh
aW1lZCBhdA0KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
cmlzY3YvbGludXguZ2l0LyBmb3ItbmV4dA0KJg0KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvcmlzY3YvbGludXguZ2l0LyBmaXhlcw0KcmVzcGVjdGl2ZWx5
Lg0KDQpQbGVhc2UgbGV0IG1lIGtub3cgaWYgeW91IG5lZWQgYW55IG1vcmUgaW5mbywNClRoYW5r
cywNCkNvbm9yLg0K
