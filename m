Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BF332A0DFE
	for <lists+linux-next@lfdr.de>; Fri, 30 Oct 2020 19:53:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727671AbgJ3Sxb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 30 Oct 2020 14:53:31 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:39110 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727433AbgJ3Sxa (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 30 Oct 2020 14:53:30 -0400
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A1FE5C009B;
        Fri, 30 Oct 2020 18:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1604084009; bh=RPYxRIgv3j7I+u7ghL6uJEgTDTGt74jNGyvK4fFTLME=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=ZhepnxadODPY0G8OQhzeHb0GsQZZwdrgx4pS1/wuVFD1xgeY3ICCJodiYlZBVVwE9
         mzz1r0W9YyGU6VTMGDnmRCs5lri//JU+2LDDhLkpwks9w/BTqZt6+p2oQJrTqKMa8B
         x+A8OwwPRykIi4/vzQMiMuJ8xxpl4AaMHx+8nOwmF8TWLgAXomPTMq+JkTkiCK7tcz
         O7uVmbBwWH8NBL0FCgSSett7F5Gy0UaFe5Aihpsy/0jiKpSlbs3Pu01bQfQNOMHWt1
         SX7Zry/AFFD7R8KkGJQulZQBg4W5/Q8bJECHdf4R0/V0RCjipSbV2xi9tbyEKwFWoJ
         QAIIZw4P5dVwg==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 2ED03A0082;
        Fri, 30 Oct 2020 18:53:26 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 8364B80292;
        Fri, 30 Oct 2020 18:53:23 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=vgupta@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="LRZF86fS";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=do66VuEp2PbY7UFdJOetNwK0pQaQYfC7ErO0z6ySKnU0EVXREyMRVrE//uECo5eWUm+mJL5BEWf2SUp8SuGlK9SRDAd06QwvHAwZlcmGEQEjA+1hIGP2VfioEzMywZrEg2ZGLf7PGFZvhzo69wnQj7W94P4/q57iftDoXooJN/69SLHLFgCICruqbOeCCzjBn8FpVZVZs4PxbZs3ITnE/KN9MoY5nuixhTj7Z+Y0K65OslqhMEDn2NnfrqGaMdCqZuZZS8hOFlu6Kv/4h+aOpItOoMlmh0LKvicwgl7peB1tFOOsnCBPwHfin9SdoPD57FM5/bDxw6je6ulUm0Sj6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RPYxRIgv3j7I+u7ghL6uJEgTDTGt74jNGyvK4fFTLME=;
 b=QfrBXVeBTfewyeESh7N9EVyc5vO9tlcJ0/dQLWIbEfje6jA/m4bob8lyHb6rsCL6ycirZE75AbrQXH4w2vVJb9ED8bn1G3hlJm/1/g+x+l/SHUGyzWz/mu6d3rIZlli+1XoAMTbW498YkZhLkgRriSAowUCWWEWW2rGEu5UGpDdPpTqoCNLN10Nk/Z0Nzte34BYA00fY9XLUGi28EpQq6IbVXj55w4neTSviStAAOwrgmC5vVIf4bVIlNP6+DOGx2MeOmkZZEBRwfdYNOL+Rkwu6BkDGgEq7lo5cP3umCv5mzcOmQ4a0F3ouZv2a8bc1woO1KNrcL+ZMx72a/gCJeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RPYxRIgv3j7I+u7ghL6uJEgTDTGt74jNGyvK4fFTLME=;
 b=LRZF86fSUM+qp1BsP4m4gqsRcq5Q+0fRCWZvFyS7e0nVkM9qS9XexcjhKa0lfbU2myTDHaJh1WIlKWvRAmiy3v2E9zNriTTvb6Y11gaPYtZiIrZFWbaKb+Uc+2MuNdm7jsErjtEqjB756+cUWy+aKYWDUGWSDKsSAoX026Xx4F0=
Received: from BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:dc::26)
 by BY5PR12MB4918.namprd12.prod.outlook.com (2603:10b6:a03:1df::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 30 Oct
 2020 18:53:21 +0000
Received: from BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c562:e026:68d6:cd31]) by BYAPR12MB3479.namprd12.prod.outlook.com
 ([fe80::c562:e026:68d6:cd31%6]) with mapi id 15.20.3477.034; Fri, 30 Oct 2020
 18:53:21 +0000
X-SNPS-Relay: synopsys.com
From:   Vineet Gupta <Vineet.Gupta1@synopsys.com>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "linux-snps-arc@lists.infradead.org" 
        <linux-snps-arc@lists.infradead.org>,
        "lkft-triage@lists.linaro.org" <lkft-triage@lists.linaro.org>
CC:     Christian Brauner <christian@brauner.io>,
        Thomas Gleixner <tglx@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Ingo Molnar <mingo@kernel.org>, Jens Axboe <axboe@kernel.dk>
Subject: Re: arc: kernel/entry.S:310: Error: inappropriate arguments for
 opcode 'and'
Thread-Topic: arc: kernel/entry.S:310: Error: inappropriate arguments for
 opcode 'and'
Thread-Index: AQHWrqef9Kvxgf+tSkKm76zYPuMJxqmwfo8A
Date:   Fri, 30 Oct 2020 18:53:21 +0000
Message-ID: <5273a136-ac9c-94fc-b6e1-d7a0abf2b385@synopsys.com>
References: <CA+G9fYth+F1TnG6GQNKtrxvChvX9m+nGa8LKFG18WCzsqNJg5w@mail.gmail.com>
In-Reply-To: <CA+G9fYth+F1TnG6GQNKtrxvChvX9m+nGa8LKFG18WCzsqNJg5w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [24.4.73.83]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab3b6536-0335-4aed-ae1e-08d87d0512be
x-ms-traffictypediagnostic: BY5PR12MB4918:
x-microsoft-antispam-prvs: <BY5PR12MB491897B0F302F4806FBAF2B7B6150@BY5PR12MB4918.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s9WsAdyYQRZ0tyaBloNQSup+M9sHtzgCuw8THCtNlrSJXy0hPu5s17WNwhQBHI0X0pJrJx4ORIfbMAYnWI/GA44hRODq5DnmjlvBCDXEqeNUiUxNkZbf7iURV+FqPnctv8T+k/VUq8rJtDoE0a9eUfPDM4S1bI/eaHirRkR8gImJPNAqmvO7kECIlBy7xvzkOEUs7/p6bG9GSrG7WZC75V/mWiKMiH6l1JG9p0uNNphTI8eQo6SC2OnqaHnaOgDmxTbKDgr+dYoQdAbVXNg38hsM5X0HtOklrc75u8unT6B8JLU7WmzIpqnwl5kIzeiGQVbholANMlgU4oiYyD9MCx0It9SczzNTZpC1mKf3R4W8dDvVPnusCukZOn9MsspYktIW5PYxdKKAB6JRTshuMOsFuxSE7Lx2M5iynw33rZtxE9z3cynfy0Tedlwl6l4/UZ952Z6oh97bIV3DCImG8Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3479.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(39860400002)(136003)(346002)(36756003)(31696002)(4326008)(110136005)(6512007)(54906003)(64756008)(8676002)(2906002)(7416002)(5660300002)(6506007)(66446008)(2616005)(53546011)(66476007)(66556008)(66946007)(31686004)(76116006)(186003)(26005)(83380400001)(316002)(71200400001)(478600001)(6486002)(4744005)(8936002)(86362001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: t8HwXeNEpCA1Jzq0fJo00ldRZSzConXAZ+e71M/ITmGSO6EauYqYJOrp5swhycykp3Qrk/rs+r/hSZwyndGr/etf/NFJ5T0GmjfENTnekkKmOIPcHnxR9uBVKeFgCMOIUVBhZKZJInUdp12LAJw0Uhe01bU6EGnL0spyjwb4L7IxO6ADqsm86q88ZEEIzZenjym1dMjun9/BTv29/ISq698RToxM7mxo7zSI5nxuau0CCtdLuJTW+HhOsYykJIyFFeF/FRzQKThOCcdGdYxozX5gBLkVfa06sD2KUFOO6pbFcAtQsteMfmVi+lZOYG3NIyguVy3BNw+FRDMuBZYnAr8Jr/QkAV/nSE9SS4JnJYSHIm9EvcO3auqwkPsHC7beK5ZPz493FSeNbE3tXdYtB7gugz+b+Hdnz/O3TvyAJ0LFBPZhO/Qk4H3BnvxkcOEV4AIGaLefuTJjWME/Uc+/nBdYuh/+1Snm91bLi3Mkd+qxKd4yD/DH5/kNusTy9wDvlSk8IBPJi7vzvPS3HTTT9Rwj7ywiPSA8+tcAJgzGSInFuekkzBxhOjL4FPuyOE5mjPIgNSOryHwlsinrq/UHpuUqnyQLrSejxO70sWi0HrnqWgBw0ixbIP7C7p3q3fkA3PsdH6D/Ms8sGteZLrD8bQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <5C9EE421E3749246BC55D0CC2EE8C211@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab3b6536-0335-4aed-ae1e-08d87d0512be
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2020 18:53:21.4300
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iR7LgJj7LWqvl1Qp+NFOyZ9hk5mol369fEUcvRlb/i+ZZl82zX1cmxswP96rckxd4Pm08+s+mL9KqdRmEt1W7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4918
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

SGkgTmFyZXNoLA0KDQpPbiAxMC8zMC8yMCAzOjI5IEFNLCBOYXJlc2ggS2FtYm9qdSB3cm90ZToN
Cj4gYXJjIGRlZmNvbmZpZyBidWlsZCBmYWlsZWQgb24gbGludXggbmV4dCAyMDIwMTAzMCB3aXRo
IGdjYy04IGFuZCBnY2MtOS4NCj4NCj4gbWFrZSAtc2sgS0JVSUxEX0JVSUxEX1VTRVI9VHV4QnVp
bGQgLUMvbGludXggLWoxNiBBUkNIPWFyYw0KPiBDUk9TU19DT01QSUxFPWFyYy1lbGYzMi0gSE9T
VENDPWdjYyBDQz0ic2NjYWNoZSBhcmMtZWxmMzItZ2NjIiBPPWJ1aWxkDQo+IHVJbWFnZQ0KPiAj
DQo+IC4uL2FyY2gvYXJjL2tlcm5lbC9lbnRyeS5TOiBBc3NlbWJsZXIgbWVzc2FnZXM6DQo+IC4u
L2FyY2gvYXJjL2tlcm5lbC9lbnRyeS5TOjMxMDogRXJyb3I6IGluYXBwcm9wcmlhdGUgYXJndW1l
bnRzIGZvciBvcGNvZGUgJ2FuZCcNCj4gbWFrZVszXTogKioqIFsuLi9zY3JpcHRzL01ha2VmaWxl
LmJ1aWxkOjM2NDoNCj4gYXJjaC9hcmMva2VybmVsL2VudHJ5LWFyY3YyLm9dIEVycm9yIDENCj4N
Cj4gUmVwb3J0ZWQtYnk6IE5hcmVzaCBLYW1ib2p1IDxuYXJlc2gua2FtYm9qdUBsaW5hcm8ub3Jn
Pg0KDQpUaHggZm9yIHJlcG9ydGluZyB0aGlzLsKgIFRoaXMgaXMgZHVlIHRvIHRoZSBzZXJpZXMg
QWRkIHN1cHBvcnQgZm9yIA0KVElGX05PVElGWV9TSUdOQUwgDQo8aHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvaW8tdXJpbmcvMjAyMDEwMjYyMDMyMzAuMzg2MzQ4LTEtYXhib2VAa2VybmVsLmRrLyNy
PndoZXJlIA0KQVJDIHBhdGNoIGlzIGJyb2tlbiBhbmQgSSBqdXN0IHJlcGxpZWQgdG8gSmVucyBh
Ym91dCBpdC4gSGUgd2lsbCANCmhvcGVmdWxseSBmaXggaXQgYW5kIHB1c2ggdXBkYXRlZCBzZXJp
ZXMgdG8gLW5leHQNCg0KVGh4LA0KLVZpbmVldA0K
