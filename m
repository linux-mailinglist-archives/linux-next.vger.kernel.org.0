Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E883223D5D3
	for <lists+linux-next@lfdr.de>; Thu,  6 Aug 2020 05:38:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731855AbgHFDiB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 5 Aug 2020 23:38:01 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:35946 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731839AbgHFDhz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 5 Aug 2020 23:37:55 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8FE23C0BBF;
        Thu,  6 Aug 2020 03:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1596685074; bh=mTbIoGVyn52PJVVHDSc/N+6tHqRUg5Cg2cxMesWoUW8=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=VT1b7xUJntyPZBA0p2Be4Bb07feXrhvz1bhLhlFJU0zJWZrQZoUJPCduYabXQZQTP
         y0rj3cOLCkeO9MMxsPNt/pMux2CS00SUhWfT95VWoHVhMEBe+Ifvq9m3LxZl5w2lml
         KWvwtelQvXvd4yPOTplkGd2d56osbRKOVVv8E9RLNfcF6g1SuoC1lavEtuldb/Sm82
         5IOUi74jxFf/QSb3bFiTYb/WaWfHj1f07kF+3Uw57acPVH7QlfsxUOr7UawxXLWmzl
         ZBpvLKO5aY6EJMqGZp16+iZXqfVUSGn1ULUrMJx74//uDtHGpgPuhdDt9x4PBa47I+
         QEYwdJqAgiFiA==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 9697AA0071;
        Thu,  6 Aug 2020 03:37:39 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id B3E4740106;
        Thu,  6 Aug 2020 03:37:34 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="QH+hchqt";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=libRj8mDZTzxw+lD96vk23ZPlLZHJHPrnHaBdREx6cEkLC2MqgzGdhDwEMbc+PdtoXOcT8cCFWNuXM2VAfrvOIuu1wQIL+LwxCX2QeAOnMWk0/EOum8C5pZgkY3YhiDnprT2k3AarROjKtoAqphHJws6LJYakIz2+5e8wsyqors8LUuyae1dg4LlpwpBB5xw6DqcnwpNb2VkFhNyR/dxFOoSi21ABXb0j1AQnuzgzS7kS7xhzh0g4TioZUPr4cbojOAyPkllUF157FBopmnq3D9+KfvAwMSt4wx80cZsD1RVgBfoiqT7mLHC129Ls5SMqQ8uo1oFAwX6JoCzLCT1Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTbIoGVyn52PJVVHDSc/N+6tHqRUg5Cg2cxMesWoUW8=;
 b=CSwuzBbiDJMsgq2FpL/YHWkLXSSETgnLEaMy3k13uWezK19a/eo3NSjlaqGwPpuVc3hacJP15/eGqQMNwErFl1IKrX9oo1UFI+Cc6RTj+cruT6vmqHZ1UG3PF7IqcOznDUsuDTEfvcDPJ1bYgVMYV4nW+SQcPpa27Gb0PD7j0TfFcK/lEynFHTS//cQvGnz5cahDEQWPO6Nfe5LxZBw11I8wgGT7LGpcbtLY7BAMLwe1DMwYQipxuk8hq96NYApZr2B2dEZJMOg6iDzStUDB1TwyTzF+6zZO7+YOYEKpV62iwL9d4eNVHWXMYBRMqmpYlWHObRaXFbCaqzzK8+3sOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTbIoGVyn52PJVVHDSc/N+6tHqRUg5Cg2cxMesWoUW8=;
 b=QH+hchqtE4WPxlc04Ku35soWCRX9dkCBohRrhBGm4UQODIxDnt+tnibUITZ9e4XOLyrmy/J7igU5adjLsVABpBIcKo8iLqr65CX7JHRGaClneihH+8YMNWQHiyq1oGv4UkyqjYzP5nrMbKiN4qi7PCrhIfGenCqRiuYdLPQirP8=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BYAPR12MB3208.namprd12.prod.outlook.com (2603:10b6:a03:13b::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18; Thu, 6 Aug
 2020 03:37:31 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::3d4f:7ae8:8767:75a4%7]) with mapi id 15.20.3239.023; Thu, 6 Aug 2020
 03:37:31 +0000
X-SNPS-Relay: synopsys.com
From:   Vineet Gupta <Vineet.Gupta1@synopsys.com>
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
        Waiman Long <longman@redhat.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Petr Mladek <pmladek@suse.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        arcml <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH 0/2] locking/qspinlock: Break qspinlock_types.h header
 loop
Thread-Topic: [PATCH 0/2] locking/qspinlock: Break qspinlock_types.h header
 loop
Thread-Index: AQHWZkWxGrDkzLqp+ESl+oI9es3nTqkfv7EAgAq5kIA=
Date:   Thu, 6 Aug 2020 03:37:31 +0000
Message-ID: <04d25afe-d258-86ba-b2d1-cee8b60ee227@synopsys.com>
References: <20200729210311.425d0e9b@canb.auug.org.au>
 <20200729114757.GA19388@gondor.apana.org.au>
 <20200729122807.GA7047@gondor.apana.org.au>
 <ed62ba67-0e1d-3fee-8c09-7750d5690be5@redhat.com>
 <CAHp75VdbZu008RcxNhMysoqBs2FSPXWv+au_ROJ7FPVd0uOhtg@mail.gmail.com>
 <20200730005922.GA9710@gondor.apana.org.au>
 <CAHp75Vf9Oj5DsGveN32i0A2TqudS+DXfhJYUOzSMJ6VD_A+2Ow@mail.gmail.com>
 <20200730075040.GA21623@gondor.apana.org.au>
In-Reply-To: <20200730075040.GA21623@gondor.apana.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: gondor.apana.org.au; dkim=none (message not signed)
 header.d=none;gondor.apana.org.au; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [73.222.250.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27af3388-65a8-4386-990d-08d839ba0ce5
x-ms-traffictypediagnostic: BYAPR12MB3208:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB320802A9B0A9A5D2E3E070C4B6480@BYAPR12MB3208.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x8aEBIpZ8ZsuuRYnLMy5Fttu4bEduikQgYOz+AxGYt0WRwZz3u2Rq0AshobUJuEJau6gPyhFjs6eVvy4uLgX8xgsQFasmMg4A9Up9BuTBFAEVrhE+RYHp0rmqimZTiie+EIsGPT8Az70fZKWgN0EmzBhWSHLP1yqVe0HzyR9ftiF7OUn6QgZVWs3s4HPJRqjJ4AWz0c9nOEajpVxzdRCzQzgHJLZZghTd5hfXPxop2C0sCNL9iV7qnlY7NjARSY4E2sevEM5RecrpHYlZoyxS/6g+1Z+yErIJpp39o2RfHFQkv3GXeHwinfmC1bZubvrXp6aQWouiDRGPhONu1DVhEdbSaaO4sh2ryW+UlvINg/kd8y3OwIgg7UTc6rJaGZK
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3479.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(396003)(346002)(376002)(136003)(39860400002)(83380400001)(26005)(66476007)(66556008)(66446008)(64756008)(8936002)(66946007)(186003)(4744005)(53546011)(6506007)(6486002)(2616005)(36756003)(478600001)(4326008)(31696002)(71200400001)(8676002)(5660300002)(86362001)(31686004)(76116006)(316002)(110136005)(7416002)(54906003)(2906002)(6512007)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: OZLHl+iGGWNc+4HBr6q4Y+80CRFiq8nOMX3Wn7QejiP+GmV7TveRzoerze6JuQmb/z8v7mqctdjAU56VI2D2H8SSTm3YIp5JPCWGw5c+yTg+V2uUCBYNHQXd3QQfatYHd4wubNrClJD7dAS759fYpRYRXf6EbYhagp6E+Z+jFyJj2BoTAm6uBF8XmdoAP9uRjDsQwY10TdgO4psdvEbraGMQhycPTM4DWEtQc8LZiLV9HRtwVASh1r1gyQe+YmFbNrVd12JYduwln0mgFDKrQTDJ86tM5F9n4K81j/CkdRvyfA3WPWC3kbWOoDkunWouyKb8VTX4tg1m9eS6UBjEDK0I1hCKJdqxestfigKJAcKZCUo+utJtXEzaW8t3serL9LVSi74h89ugWjyuvm3hswIU7JVz40dhKX5t7Oy8fafP2VumjOy/7j1rvfcHHo+NdncNnuShbwoYrwzB/k1IwjgEi+6Syw4e8PzDxbCscgK6hvFoPULRCPjIhR0BhF61QyjvQBzzVUake/E2Ni4VOeGwkjp5Lj/vIPZ4uxdZ1pdJiixv/VkaQBzMhz/HHAmDafNDCZ51Ly7KKv4fL4yyKgWrKVqiA0ZcYc82dOa2Chge0MR8zZ4/DHdydiOP9h5tO8xXGh7+8aoWJawFUWSuXQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <CDC31A1DA336914D8DA7A55C2E028D7B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27af3388-65a8-4386-990d-08d839ba0ce5
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2020 03:37:31.4819
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rcNNqOKg/VsLQnwiYYC3VpDf4P4f4fyf4WAvNfsvfnfl8irMThlAwi18MhAjpR9d1xGjPc5Lbv0xgC8fyjMqbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3208
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

T24gNy8zMC8yMCAxMjo1MCBBTSwgSGVyYmVydCBYdSB3cm90ZToNCj4gT24gVGh1LCBKdWwgMzAs
IDIwMjAgYXQgMTA6NDc6MTZBTSArMDMwMCwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOg0KPj4gV2Ug
bWF5IGFzayBTeW5vcHN5cyBmb2xrcyB0byBsb29rIGF0IHRoaXMgYXMgd2VsbC4NCj4+IFZpbmVl
dCwgYW55IGlkZWFzIGlmIHdlIG1heSB1bmlmeSBBVE9NSUM2NF9JTklUKCkgYWNyb3NzIHRoZSBh
cmNoaXRlY3R1cmVzPw0KPiBJIGRvbid0IHRoaW5rIHRoZXJlIGlzIGFueSB0ZWNobmljYWwgZGlm
ZmljdWx0eS4gIFRoZSBjdXN0b20NCj4gYXRvbWljNjRfdCBzaW1wbHkgYWRkcyBhbiBhbGlnbm1l
bnQgcmVxdWlyZW1lbnQgc28gdGhlIGluaXRpYWxpc29yDQo+IHJlbWFpbnMgdGhlIHNhbWUuDQoN
CkV4YWN0bHkgc28uDQoNCkZXSVcgdGhlIGFsaWdubWVudCByZXF1aXJlbWVudCBpcyBiZWNhdXNl
IEFSQyBBQkkgYWxsb3dzIDY0LWJpdCBkYXRhIHRvIGJlIDMyLWJpdA0KYWxpZ25lZCBwcm92aWRl
ZCBoYXJkd2FyZSBkZWFscyBmaW5lIHdpdGggNCBieXRlIGFsaWduZWQgZm9yIHRoZSBub24tYXRv
bWljDQpkb3VibGUtbG9hZC9zdG9yZSBMREQvU1REIGluc3RydWN0aW9ucy4gVGhlIDY0LWJpdCBh
bGlnbmVtZW50IGhvd2V2ZXIgaXMgcmVxdWlyZWQNCmZvciBhdG9taWMgZG91YmxlIGxvYWQvc3Rv
cmUgTExPQ0tEL1NDT05ERCBpbnN0cnVjdGlvbnMgaGVuY2UgdGhlIGRlZmluaXRpb24gb2YNCkFS
QyBhdG9taWM2NF90DQoNCi1WaW5lZXQNCg==
