Return-Path: <linux-next+bounces-2636-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6768912E43
	for <lists+linux-next@lfdr.de>; Fri, 21 Jun 2024 22:09:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D11DB1C221DD
	for <lists+linux-next@lfdr.de>; Fri, 21 Jun 2024 20:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A50516C87F;
	Fri, 21 Jun 2024 20:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="na9bGN8U"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-fw-52004.amazon.com (smtp-fw-52004.amazon.com [52.119.213.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C8C15FA96;
	Fri, 21 Jun 2024 20:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.119.213.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719000539; cv=none; b=WRnqvZLNYPcGShQojiPqXWx159rbrvDXtw8zXlZpAJ1YpmQ9ImYZD4h72m/m/bA9aHWJIJjZC9HQgzdGNueMDKYOUeID+pIVoLvpSm/bG5Y2zJ2jccERxg5OcRaFIReV7TI3Yu7JzI1vTFNyJyVcHybmCFTQ0Q1+TzDoeXhkQIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719000539; c=relaxed/simple;
	bh=7MZ/ulyeI/h2qVv8BKfEKWjAQc8ZM/Ox7Bz9Ch8l860=;
	h=Subject:From:To:CC:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ao226Yc9xYWMWuPh6EUIPhl0RcPanobI0WoJjF8DjJ5qcycRSuAmysVB6qGD28SxDAmZItNJCY8eHBKJ2RnI5p/Lv9cMpYyxVGD8ihDO5dy5O4dYRt/QeFHWSOy28FSmjETMjiEzDPh3ekmPh109uT8sFaM+5rFrdDGHIDNPzL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=na9bGN8U; arc=none smtp.client-ip=52.119.213.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1719000537; x=1750536537;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version:subject;
  bh=7MZ/ulyeI/h2qVv8BKfEKWjAQc8ZM/Ox7Bz9Ch8l860=;
  b=na9bGN8US+eBd4IbKB1mywK53Y08PwUDyTd0LJXHjKCeLUPegN+1UOQo
   DYzyBp+wCJOzN16gqd7qLKnyZoGOf8m/bNsqE8JwkjP/AK68ECjXv4uHx
   C6dpp4+kaGmf1HdkH8d8XqrFmIGVsqmAtnVpLe870W6FbXoiHe0Hc1pxk
   Y=;
X-IronPort-AV: E=Sophos;i="6.08,255,1712620800"; 
   d="scan'208";a="213360406"
Subject: Re: linux-next: manual merge of the memblock tree with the origin tree
Thread-Topic: linux-next: manual merge of the memblock tree with the origin tree
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.2])
  by smtp-border-fw-52004.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 20:08:55 +0000
Received: from EX19MTAEUA002.ant.amazon.com [10.0.43.254:42217]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.27.118:2525] with esmtp (Farcaster)
 id becf57e2-a8ba-4cac-9cf0-99619c563fe2; Fri, 21 Jun 2024 20:08:53 +0000 (UTC)
X-Farcaster-Flow-ID: becf57e2-a8ba-4cac-9cf0-99619c563fe2
Received: from EX19D014EUC002.ant.amazon.com (10.252.51.161) by
 EX19MTAEUA002.ant.amazon.com (10.252.50.126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Fri, 21 Jun 2024 20:08:53 +0000
Received: from EX19D014EUC004.ant.amazon.com (10.252.51.182) by
 EX19D014EUC002.ant.amazon.com (10.252.51.161) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Fri, 21 Jun 2024 20:08:53 +0000
Received: from EX19D014EUC004.ant.amazon.com ([fe80::76dd:4020:4ff2:1e41]) by
 EX19D014EUC004.ant.amazon.com ([fe80::76dd:4020:4ff2:1e41%3]) with mapi id
 15.02.1258.034; Fri, 21 Jun 2024 20:08:53 +0000
From: "Gowans, James" <jgowans@amazon.com>
To: "broonie@kernel.org" <broonie@kernel.org>
CC: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
	"jbeulich@suse.com" <jbeulich@suse.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "rppt@kernel.org" <rppt@kernel.org>
Thread-Index: AQHawypHT4hIOONPdEuIzJZkPab/U7HQ0aEAgAABrICAAB1rgIAAAHyAgAG2IwA=
Date: Fri, 21 Jun 2024 20:08:53 +0000
Message-ID: <9262bfba5d65c603dcad49a75e5a30564f75c3d4.camel@amazon.com>
References: <ZnRQv-EVf2LQ1Cjv@sirena.org.uk>
	 <eb58b1b2f84444acde3f9e25219fa40c73c499f8.camel@amazon.com>
	 <db13f2b7-88da-42db-85ed-d78cdd5f6c62@sirena.org.uk>
	 <e6f1bf73d13060635520c70df269c0b390352f37.camel@amazon.com>
	 <44ce3730-8e4d-42f9-8b17-104805e46f93@sirena.org.uk>
In-Reply-To: <44ce3730-8e4d-42f9-8b17-104805e46f93@sirena.org.uk>
Accept-Language: en-ZA, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <BB6A4DA47CA8BB43B4FC501C859E1480@amazon.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGkgTWFyaywNCg0KT24gVGh1LCAyMDI0LTA2LTIwIGF0IDE5OjAwICswMTAwLCBNYXJrIEJyb3du
IHdyb3RlOg0KPiBPbiBUaHUsIEp1biAyMCwgMjAyNCBhdCAwNTo1OTowNVBNICswMDAwLCBHb3dh
bnMsIEphbWVzIHdyb3RlOg0KPiANCj4gPiBDb3JyZWN0IG1lIGlmIEknbSB3cm9uZywgYnV0IGl0
IGxvb2tzIGxpa2UgdGhlIGlmIHN0YXRlbWVudCBvbmx5IGdvdA0KPiA+IGRlbGV0ZWQgYW5kIG5v
dCBtb3ZlZCwgc28gdGhpcyB3b3VsZCBuZWVkIHRvIGJlIHJlLXdvcmtlZC4NCj4gDQo+IFllcywg
dGhlIG1lcmdlIGluIC1uZXh0IGlzIHdyb25nLg0KDQpXaGF0J3MgdGhlIG5leHQgc3RlcCB0byBm
aXggdGhlIGluY29ycmVjdCBtZXJnZSBjb21taXQ/DQpMb29raW5nIGF0IHRvZGF5J3MgLW5leHQg
SSBzZWUgdGhlIHNhbWUgaXNzdWU6DQpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC9uZXh0L2xpbnV4LW5leHQuZ2l0L2NvbW1pdC9tbS9tZW1ibG9jay5jP2g9
bmV4dC0yMDI0MDYyMSZpZD1mNjg5ZWU0YzA2MjMxN2EwODMxZmJmZmVlYjMwZDc4MTY2MDhiMmU3
DQoNCkpHDQo=

