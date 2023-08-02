Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 786D376D3EE
	for <lists+linux-next@lfdr.de>; Wed,  2 Aug 2023 18:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbjHBQov (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Aug 2023 12:44:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229923AbjHBQot (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Aug 2023 12:44:49 -0400
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F126188;
        Wed,  2 Aug 2023 09:44:47 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 372GiBEi038861;
        Wed, 2 Aug 2023 11:44:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1690994651;
        bh=3kBRAYwRwhay7rJWjkHBR9qDTkgWytjud1XNRDdBkkE=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=AANTIcvtzvN4tVq8rUWCAnNh4OIilgtTEcF260TGrzJiWqr7dqTbhwhAMqUEQ2wlV
         1tg2cI9xWlk+H6qPXCODWufFRHN9fPsMzSVGQCIyPKbr9/HOcaA5asOq6z59/1ov7p
         4Ni2WfkC0DZN+W+In9V8LqGhuwRoUJW/gFkQZJXM=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 372GiB2G030742
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 2 Aug 2023 11:44:11 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 2
 Aug 2023 11:44:11 -0500
Received: from DLEE107.ent.ti.com ([fe80::1c91:43d:d71:d7b6]) by
 DLEE107.ent.ti.com ([fe80::1c91:43d:d71:d7b6%17]) with mapi id
 15.01.2507.023; Wed, 2 Aug 2023 11:44:11 -0500
From:   "Kumar, Udit" <u-kumar1@ti.com>
To:     Bart Van Assche <bvanassche@acm.org>,
        "Martin K . Petersen" <martin.petersen@oracle.com>
CC:     "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        Avri Altman <avri.altman@wdc.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        "Bao D . Nguyen" <quic_nguyenb@quicinc.com>,
        Eric Biggers <ebiggers@google.com>,
        "Bean Huo" <beanhuo@micron.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Can Guo <quic_cang@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Asutosh Das <quic_asutoshd@quicinc.com>,
        Po-Wen Kao <powen.kao@mediatek.com>,
        Yang Li <yang.lee@linux.alibaba.com>,
        Arthur Simchaev <Arthur.Simchaev@wdc.com>,
        Kiwoong Kim <kwmad.kim@samsung.com>,
        "Menon, Nishanth" <nm@ti.com>, "Gole, Dhruva" <d-gole@ti.com>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Subject: RE: [PATCH v2 11/12] scsi: ufs: Simplify transfer request header
 initialization
Thread-Topic: [PATCH v2 11/12] scsi: ufs: Simplify transfer request header
 initialization
Thread-Index: AQHZxTP5AHJX9Bb+D0a3TK13N+V7x6/Xf76A//+2k0A=
Date:   Wed, 2 Aug 2023 16:44:11 +0000
Message-ID: <96e0abb37d364da3b9d04c0c2f3378f6@ti.com>
References: <20230727194457.3152309-1-bvanassche@acm.org>
 <20230727194457.3152309-12-bvanassche@acm.org>
 <97281aba-a78c-7f75-fc15-af43e4df4907@ti.com>
 <70b8adef-02ac-4557-97d3-cbf8537edfb2@acm.org>
In-Reply-To: <70b8adef-02ac-4557-97d3-cbf8537edfb2@acm.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.249.141.75]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

VGhhbmtzIEJhcnQNCg0KPg0KPk9uIDgvMi8yMyAwNDoyNSwgS3VtYXIsIFVkaXQgd3JvdGU6DQo+
PiBXaGlsZSBidWlsZGluZyBuZXh0LTIwMjMwODAxIGZvciBBUk02NCBhcmNoaXRlY3R1cmUsDQo+
Pg0KPj4gdGhpcyBwYXRjaCBpcyBnaXZpbmcgY29tcGlsYXRpb24gZXJyb3INCj4+DQo+PiBJbiBm
dW5jdGlvbiDigJh1ZnNoY2RfY2hlY2tfaGVhZGVyX2xheW91dOKAmSwNCj4+ICDCoMKgwqAgaW5s
aW5lZCBmcm9tIOKAmHVmc2hjZF9jb3JlX2luaXTigJkgYXQgZHJpdmVycy91ZnMvY29yZS91ZnNo
Y2QuYzoxMDYyOToyOg0KPj4gLi8uL2luY2x1ZGUvbGludXgvY29tcGlsZXJfdHlwZXMuaDozOTc6
Mzg6IGVycm9yOiBjYWxsIHRvDQo+PiDigJhfX2NvbXBpbGV0aW1lX2Fzc2VydF81NTTigJkgZGVj
bGFyZWQgd2l0aCBhdHRyaWJ1dGUgZXJyb3I6IEJVSUxEX0JVR19PTg0KPj4gZmFpbGVkOiAoKHU4
ICopJihzdHJ1Y3QgcmVxdWVzdF9kZXNjX2hlYWRlcil7IC5lbmFibGVfY3J5cHRvID0gMX0pWzJd
DQo+PiAhPQ0KPj4gMHg4MA0KPj4gIMKgIDM5NyB8wqAgX2NvbXBpbGV0aW1lX2Fzc2VydChjb25k
aXRpb24sIG1zZywgX19jb21waWxldGltZV9hc3NlcnRfLA0KPj4gX19DT1VOVEVSX18pDQo+Pg0K
Pj4NCj4+IGNvbXBpbGVyIGluZm9ybWF0aW9uDQo+Pg0KPj4gd2dldA0KPj4gaHR0cHM6Ly9kZXZl
bG9wZXIuYXJtLmNvbS8tL21lZGlhL0ZpbGVzL2Rvd25sb2Fkcy9nbnUtYS85LjItMjAxOS4xMi9i
aQ0KPj4gbnJlbC9nY2MtYXJtLTkuMi0yMDE5LjEyLXg4Nl82NC1hYXJjaDY0LW5vbmUtbGludXgt
Z251LnRhci54eg0KPg0KPkRvZXMgdGhpcyBwYXRjaCBoZWxwOg0KPmh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xpbnV4LXNjc2kvMjAyMzA4MDEyMzIyMDQuMTQ4MTkwMi0xLQ0KPmJ2YW5hc3NjaGVA
YWNtLm9yZy8/DQoNClllcyAsIGJ1aWxkIHdvcmtzIGZvciBtZSB3aXRoIHRoaXMgcGF0Y2guDQpZ
b3UganVzdCBza2lwcGVkIGJhc2VkIHVwb24gY29tcGlsZXIgdmVyc2lvbiAgYnV0IA0Kd2hhdCBh
Ym91dCBjaGVja3MgeW91IHdhbnQgdG8gZG8gaW4gdGhpcyBmdW5jdGlvbi4gDQoNCg0KPlRoYW5r
cywNCj4NCj5CYXJ0Lg0KDQo=
