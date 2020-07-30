Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 648DF232A41
	for <lists+linux-next@lfdr.de>; Thu, 30 Jul 2020 05:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726724AbgG3DKY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jul 2020 23:10:24 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:14858 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726519AbgG3DKY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Jul 2020 23:10:24 -0400
X-UUID: 4aa88a62df55454295d747cab3951cc1-20200730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=X5/k5uISNAhPP8r+KLgwOAhdsHCqej1bMnApxEJk9xc=;
        b=Ibj1sb1uR41YNd1EEujUCtMqmQkK3hELgpPLi3ZaVS1t8Gb6HkAaDLUvIgKLxIK0CeW6UMXX3xkffk5s7VnNCNP6+s21V/AWTNwQ5NxsSMpEIHzuFXRqn2/RjWBAtxBNnQ1HjiXJm/oyBRfkAHYd/g211OCeh67TZ3b3c1sfPW0=;
X-UUID: 4aa88a62df55454295d747cab3951cc1-20200730
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <neal.liu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 774553420; Thu, 30 Jul 2020 11:10:21 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Jul 2020 11:10:17 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 30 Jul 2020 11:10:17 +0800
Message-ID: <1596078619.23705.0.camel@mtkswgap22>
Subject: Re: linux-next: build warning after merge of the pm tree
From:   Neal Liu <neal.liu@mediatek.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>
Date:   Thu, 30 Jul 2020 11:10:19 +0800
In-Reply-To: <20200730125500.0947e1dd@canb.auug.org.au>
References: <20200730125500.0947e1dd@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

VGhpcyB3YXJuaW5nIHNob3VsZCBiZSBmaXhlZCBhbHNvLg0KU2hvdWxkIEkgc2VuZCBhbm90aGVy
IHBhdGNoPw0KDQpUaGFua3MgIQ0KDQpPbiBUaHUsIDIwMjAtMDctMzAgYXQgMTI6NTUgKzEwMDAs
IFN0ZXBoZW4gUm90aHdlbGwgd3JvdGU6DQo+IEhpIGFsbCwNCj4gDQo+IEFmdGVyIG1lcmdpbmcg
dGhlIHBtIHRyZWUsIHRvZGF5J3MgbGludXgtbmV4dCBidWlsZCAoeDg2XzY0IGFsbG1vZGNvbmZp
ZykNCj4gcHJvZHVjZWQgdGhpcyB3YXJuaW5nOg0KPiANCj4gZHJpdmVycy9hY3BpL3Byb2Nlc3Nv
cl9pZGxlLmM6IEluIGZ1bmN0aW9uICdhY3BpX2lkbGVfZW50ZXJfczJpZGxlJzoNCj4gZHJpdmVy
cy9hY3BpL3Byb2Nlc3Nvcl9pZGxlLmM6NjY2OjQ6IHdhcm5pbmc6ICdyZXR1cm4nIHdpdGggbm8g
dmFsdWUsIGluIGZ1bmN0aW9uIHJldHVybmluZyBub24tdm9pZCBbLVdyZXR1cm4tdHlwZV0NCj4g
ICA2NjYgfCAgICByZXR1cm47DQo+ICAgICAgIHwgICAgXn5+fn5+DQo+IGRyaXZlcnMvYWNwaS9w
cm9jZXNzb3JfaWRsZS5jOjY1NzoxMjogbm90ZTogZGVjbGFyZWQgaGVyZQ0KPiAgIDY1NyB8IHN0
YXRpYyBpbnQgYWNwaV9pZGxlX2VudGVyX3MyaWRsZShzdHJ1Y3QgY3B1aWRsZV9kZXZpY2UgKmRl
diwNCj4gICAgICAgfCAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4gZHJpdmVy
cy9hY3BpL3Byb2Nlc3Nvcl9pZGxlLmM6NjcwOjQ6IHdhcm5pbmc6ICdyZXR1cm4nIHdpdGggbm8g
dmFsdWUsIGluIGZ1bmN0aW9uIHJldHVybmluZyBub24tdm9pZCBbLVdyZXR1cm4tdHlwZV0NCj4g
ICA2NzAgfCAgICByZXR1cm47DQo+ICAgICAgIHwgICAgXn5+fn5+DQo+IGRyaXZlcnMvYWNwaS9w
cm9jZXNzb3JfaWRsZS5jOjY1NzoxMjogbm90ZTogZGVjbGFyZWQgaGVyZQ0KPiAgIDY1NyB8IHN0
YXRpYyBpbnQgYWNwaV9pZGxlX2VudGVyX3MyaWRsZShzdHJ1Y3QgY3B1aWRsZV9kZXZpY2UgKmRl
diwNCj4gICAgICAgfCAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4gDQo+IElu
dHJvZHVjZWQgYnkgY29tbWl0DQo+IA0KPiAgIGVmZTk3MTEyMTRlNiAoImNwdWlkbGU6IGNoYW5n
ZSBlbnRlcl9zMmlkbGUoKSBwcm90b3R5cGUiKQ0KPiANCg0K

