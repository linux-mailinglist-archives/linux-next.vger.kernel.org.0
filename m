Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AC9C36BB13
	for <lists+linux-next@lfdr.de>; Mon, 26 Apr 2021 23:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235493AbhDZVN1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Apr 2021 17:13:27 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:37240 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235418AbhDZVN0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Apr 2021 17:13:26 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7252BC0083;
        Mon, 26 Apr 2021 21:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1619471564; bh=uS+tCZakfDs9+y8zq3JRXoGncN9mVWtaP4n6yoFxB/Q=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Mj33mux4r4VkMPq4d29enaYi9z2awSssQqQNEQYOFNVd9qULNOKGcosehCnzpexpH
         1QV6Iz6gQmR7WCinM9/00KZNtRBwDZGIarblnRkP2uy4b6Fgip3N3fOg6KEE6Vyxod
         t3aEveYoaUTAVbueOJLSUCkCXcYbJlJsUUNfZZueKtsbAsPWe86ZoBqkm53Wse0sKK
         a+ry5QT4Xg+KWphAVDCViYfhh7hSvschxLvHg9D28TVHpOphg89hJbBSaldGJck8e7
         kjz2YNC7gp85M7vOdB3NaBPKwksBHiL2ZZ0rXqBMa1Wck+S9m5vVZnSvzhTsFHgIQi
         Lw42yT3Pz5MSA==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 990EDA007C;
        Mon, 26 Apr 2021 21:12:41 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 537A7800BE;
        Mon, 26 Apr 2021 21:12:40 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="lQFnCX2J";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ceu7nif0hm3OjzGXkwwRez20NPb6F0/hvGfIau8DdGxd6wZ1mxEO5gRw3/y82yQnI6w0AEFx0tBnZsIPz4+l5HnWOYq+qoDWb6fIp5HHoQnzgAOlDr+7SbkLqxPRY1I/ZktTkdZC6yZZcuqeo9ERNezL48xQ181AXYoniEulLzBusU+icBtrXu58a51os9kmjhsYYrLeGoFBe8l+zViyJLa1b2KcGvmm8avKMeGjOcSYF0ZqA0tQh/MG1YJaZjtbheExpIAnZrMUnVtKlvvrfKKhysaX0sl+ZRaGn1JFJeKj0hUrDfLPEx2jgYNqj279KlSUMNOa2z6pqcHRcWx6gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uS+tCZakfDs9+y8zq3JRXoGncN9mVWtaP4n6yoFxB/Q=;
 b=FcA5IM47o7NvttS0xMJPBwuZ3mhu8sYcHwWRdqVmxRKI0AYviHuD8YkPgwbiyZWYH6lzdiyx3eKmCRJsc9IMze/VvpEgfopPcUWJM2KezL1K21IxbBohgnSCXQMayJiCwpTWGkyqTPGHg0dpuLIVj7ZUsqTg7OUjjxpC7oJYbn0hNdTmtFwIMPTBoufqSdb1VWEo1MLP6ipOU5dTFa2U66b+ilWi9hr8E0TqJV5ULKrDykQ3vUUL7LwAjZb8baHVLX57GvKgWnINIzkHaiUXPGgNEOyYmRVt8rmcgYSezXCg52TQTljXQ2xqvWyfK0F4st2O0yKQcmVHuyo7GCpMFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uS+tCZakfDs9+y8zq3JRXoGncN9mVWtaP4n6yoFxB/Q=;
 b=lQFnCX2JKxwKZggAGiC51ZcDa94zfmsgAkmgMx1Ovl4wD3+/7S80ZtNVaovVsBlHp0vKR4WSbdWJSMfT5dzkEarwIYKqDVB1dyd1DBM4fNm8H/Ihfmwb0hKCKk/xoFujrM/saNSC626jVfQOwj9xew0A3ELD4G173OpSLoAwFmo=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BYAPR12MB2662.namprd12.prod.outlook.com (2603:10b6:a03:61::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25; Mon, 26 Apr
 2021 21:12:38 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c%6]) with mapi id 15.20.4065.027; Mon, 26 Apr 2021
 21:12:38 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the usb tree
Thread-Topic: linux-next: build warning after merge of the usb tree
Thread-Index: AQHXOpj4Qu8fA1ueHEWfl/VVwqQl26rGwTWAgACLXYA=
Date:   Mon, 26 Apr 2021 21:12:38 +0000
Message-ID: <2dffbc68-4d5a-99bf-14d4-1ba4b11200d1@synopsys.com>
References: <20210426223733.6aef5612@canb.auug.org.au>
 <YIa33XMckeamVe2l@kroah.com>
In-Reply-To: <YIa33XMckeamVe2l@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
authentication-results: kroah.com; dkim=none (message not signed)
 header.d=none;kroah.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 487747e1-c1e2-43a5-3bb6-08d908f80581
x-ms-traffictypediagnostic: BYAPR12MB2662:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB266289644D59C69C5FC9116BAA429@BYAPR12MB2662.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:655;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qyp+QHK6SyhvtGa1X+mpk7SFHzrRPHV8Y5ZorK8LlbxH6mqI0VgL162KA+vqP5N6o6ovKI2kJmiKuJYWcVnSFHynULvQe1NRtTHo8e06iHDaLbowNGEsrRZOkS6BEk2+MxpqwbOKNfPCyVa4cfB6SOj8xBf7JKkWhOJ4GT0RlAmKnyon4pRjuEUgkW2ltz+JcmaQn+BSH8ZqjNCG8Exh01plgCRvahnrszbzsX7yMF6xk/8JISjiiGim/UcXxE1KKfAZdXv2aTlILiiykbAnV2dsU9C6hW+NI9Oe5lHx4fYAauQ4kOIS7kyl9WdPtJ/5blRld5riRcT9F98TvAE+EpK+HxIr9fekxGcx7U+Kh+yAW3o9v5gSp7OWWlv92U5+gZqHl9zMqaic88uQPOtnIxFwPLZRZwajgTcc/aZi9JmrjUnCqRQU7ThkseKg3T0TWLwMyxooGf0/r+0rzApTaErbAO8WJylO73z8jpbg9kwGcDXWhpY8u+DL2tV+qFxbohylhT/li7JP2ezmqYVz52bI7WpJALLFDTJoh7S0Nfd7yovZkQir4I04Pi4+afBgRbr/wzmj9cS8TiOfEHcat3CuJlCjbaRybikXBxrZMEKrvYS0dnH2ln1e0XeqwG/0oYD1ePLQGPfYxSAnTM/09txhrROYeswbFCWVCqlYuyIQIl7JtYmi/UDuio+zcKBB
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(366004)(136003)(396003)(39850400004)(83380400001)(186003)(36756003)(4326008)(2906002)(4744005)(316002)(38100700002)(26005)(66476007)(76116006)(2616005)(31696002)(122000001)(478600001)(66946007)(31686004)(66556008)(6486002)(66446008)(86362001)(5660300002)(64756008)(8936002)(8676002)(6512007)(54906003)(71200400001)(6506007)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?aWJCZSt2bXlGNXgwdXQ2Y0hGR2xPK3UrUFFnQ0RzT2dscnhrTHZzSGdNWVIv?=
 =?utf-8?B?ajhJNVpzYTlVb1RMNnRvQWxjYVg1MEp2REJKeUdUSlJ6d1VBSEd0ZHE2UUlG?=
 =?utf-8?B?Y3JnSlg5NWloQXp4SE5RUlQvWktrQlhyVmpSK0d3QTYvbXJjMER0QnJkWm1s?=
 =?utf-8?B?MEluOUFLa3F4TXJiL0FkOHVvU0xwTGRRU1ZCZzJlWDhkN0plamk3aDRubml0?=
 =?utf-8?B?a2hibWZtK3VzUTV6OGVBRk5Sc1BuUzBBQndXR0tGK0pKSDB1dnNrUjBqZmtR?=
 =?utf-8?B?THBCWVEyWlRIMTRqR293clA3UFZPdCtiazd5Z3FQQ1dEQ01nVnlGellKT0sy?=
 =?utf-8?B?cngvYXREWGUyT0E1dWlyV3JTZ01UcFJCN09wSTAzbEErZkNHdFFSZGlGMW5M?=
 =?utf-8?B?TzkrNEYvVVl4Tm1QeUQzNi9qVUVDYUFseUVvbzZJZEZMM20wNzVzcGFOL2t5?=
 =?utf-8?B?YUs3OVN2SjAwcHJtY2tsbE1kRCtSZmEvb3F6a3RVVC9BdXo2c1N6eUlxd3Uy?=
 =?utf-8?B?eUtCWlRkWGN1Z05nRXJIVDhSeGpTcFk1OXlXbm5Cd1hWRVV2NGFIVktBNHhJ?=
 =?utf-8?B?QXVXS0dnYWwweTlhUjhvU0w1cWRYV2ZQSFhxdnJnWVN0ZFl3ZU55UGlnYmpM?=
 =?utf-8?B?OVVyNk05dUpxUTcxZDlhd3BlSHhJTnV3U01PYVBsMmhaa0MrSkg3K2c1akFF?=
 =?utf-8?B?eVF3c3p5VHdQMGxJTEp5TUJGN0grVWVxZDByVDJGbW9OUUM3T3pCbjBiU2lP?=
 =?utf-8?B?alpwUVNMaXN2WEU0SGVNMjY5NkJyalZtUGUzVjdITkF4RnNSNjhtUXh6Yysv?=
 =?utf-8?B?ZzQ5cjQzcGxTYVpFZnEvUFloa0RTYUFNUHVEa3czSVQxZEZkMjV6N2FEaFVm?=
 =?utf-8?B?ZXlHenlzTFlobzJtMUxFWUh4N2NLWXVWNEs4dUNxVW9SbGowL0I3UHdUUUd6?=
 =?utf-8?B?OXg2WWdadzJ6WnBzYkFVN1JMV013UlZXMmZzS0hYY25ZRlRYUi9HVmdGQmxu?=
 =?utf-8?B?M2VxQ0F3UmpnUGJjZjI1ZjNSa2RHeHNaUkRTR0pYMVprNS9ZVXlMWTdjZVh0?=
 =?utf-8?B?MjdwajdmaXMzT0dXMGZueGw0NXFiMWZsT0loSkNKUG9pcVh2d2NVWEVvbzA2?=
 =?utf-8?B?NjlNY3p6VFdrWEwwMVQzVjd2aUNmZlJjZnE0MWhsNGpobzEyQ0wrWVR2M2d1?=
 =?utf-8?B?c0oxQlVtaHhyWVkzQ3ZiQjlscUNYYTZ2RXdSbW50eTVNd2FPQ0tGOUU0YmF0?=
 =?utf-8?B?VVhUZXg5NHBBODE3SE95emJ6WDhNU3ljNEFpdjRUWFc3Wjl2MXBQOGx5UGl0?=
 =?utf-8?B?UFZTcG5KdmVtcVY5SGNLL2QrWWJTcjgvdkhqUkVBNFFOSFNWdWlvajN2MWRX?=
 =?utf-8?B?ZEJLbFVKcVJ4VEsxb0lJV0w0MHRUckhMMUw2eW0wT1c4SHpadVRqVU5tOHZP?=
 =?utf-8?B?TTNLT3FHRXlFYXdTN0prelFqNEZpOG9lcnNPZHZsU3pGNWJwdEhhSytjdlRW?=
 =?utf-8?B?cE5wc25EMTdVNW8yQW9BNUkxeW5JRnZJaXBaNkEySGFrZWpEYVdidjRRZk5H?=
 =?utf-8?B?NXVyWnMwVzVoS09FMEk2VHZkQUF6SVdJWmdoay9JN1NpK2doVXVKUzgxUVZy?=
 =?utf-8?B?cHlWeDM3WlpGM0FHRndqemszTTlydDF0YS92OTc0UEdhMVVhNlE2UnFyUzZK?=
 =?utf-8?B?dEJWN3Z4bm5JY1c1Vk5xVTFUUzhZRlo2R0NkTkcvNVBaOXphTG4xdGNnUlVY?=
 =?utf-8?Q?tYFgJZadZfDxOlwgg0NyQmFLOC2SEzr2Ct/eJbQ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FE472088EF1B404B8984F5C3BA83A1FD@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 487747e1-c1e2-43a5-3bb6-08d908f80581
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2021 21:12:38.4474
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sICxF1nmnaJkr0/0rgT8YTlnZoLNnv9qP4pazHgc0+5wz8xG+kOvaZ1iENeKpilynd7prZsbRtIwEzXHWeguGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2662
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

R3JlZyBLSCB3cm90ZToNCj4gT24gTW9uLCBBcHIgMjYsIDIwMjEgYXQgMTA6Mzc6MzNQTSArMTAw
MCwgU3RlcGhlbiBSb3Rod2VsbCB3cm90ZToNCj4+IEhpIGFsbCwNCj4+DQo+PiBBZnRlciBtZXJn
aW5nIHRoZSB1c2IgdHJlZSwgdG9kYXkncyBsaW51eC1uZXh0IGJ1aWxkIChodG1sZG9jcykgcHJv
ZHVjZWQNCj4+IHRoaXMgd2FybmluZzoNCj4+DQo+PiBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuaDo4
NjU6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2h3cGFyYW1zOScgbm90
IGRlc2NyaWJlZCBpbiAnZHdjM19od3BhcmFtcycNCj4+DQo+PiBJbnRyb2R1Y2VkIGJ5IGNvbW1p
dA0KPj4NCj4+ICAgMTY3MTAzODBkM2FhICgidXNiOiBkd2MzOiBDYXB0dXJlIG5ldyBjYXBhYmls
aXR5IHJlZ2lzdGVyIEdIV1BBUkFNUzkiKQ0KPiANCj4gVGhpbmgsIGNhbiB5b3Ugc3VibWl0IGEg
Zml4IGZvciB0aGlzPw0KPiANCg0KTXkgbWlzdGFrZS4gSnVzdCBzdWJtaXR0ZWQgaXQuDQoNClRo
YW5rcywNClRoaW5oDQo=
