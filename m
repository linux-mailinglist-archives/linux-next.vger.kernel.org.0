Return-Path: <linux-next+bounces-4323-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA0A9A29AA
	for <lists+linux-next@lfdr.de>; Thu, 17 Oct 2024 18:53:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 418DA283446
	for <lists+linux-next@lfdr.de>; Thu, 17 Oct 2024 16:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C96231DF738;
	Thu, 17 Oct 2024 16:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hQA4JQQy"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9214A1DF742;
	Thu, 17 Oct 2024 16:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729183947; cv=none; b=iSgb9j0+6ghMlUqDLUxX9QusgAz7J2Gzkrqaq5LU+jpgmRIfXz8nMPFhBV9lbbOCGrjIexdANZtXkL4T2iVdxVwHphfcyFmfJWwaTPu2k1U+erFX/DfGmziUQxbKXNvVdiIbmuRKhZq+MOt2F/xIGBooe0kUHH/+lBhdBllhpec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729183947; c=relaxed/simple;
	bh=U7CvCYGjKt8zciHXkg8ASuf8k6xH+BAXoknwZwwlr4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M3J3HYoTiKjYruyFM7PcQTzT5b4K7ifO6dPe0XqqxqDiNyvwDcrTH1ZCR7fJ7y/be3uWGb78tBUna/78T7pBg3Qo8huWZOPgCkJf2sCKX31LUR+SIbIiACwcSzB3y5MmxMZMoLHvBy3UZF1Bc3XsdxMmDpUptuhvLdcKDXNTeHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hQA4JQQy; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c9fd6dae47so1246414a12.2;
        Thu, 17 Oct 2024 09:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729183941; x=1729788741; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7CvCYGjKt8zciHXkg8ASuf8k6xH+BAXoknwZwwlr4A=;
        b=hQA4JQQyqiOvT3Bq8V+s8j/+XbBZaLvNIseG05aFdD+KKdS63ohgK1w8E3z5pGxmBj
         zmawWEgWgJdOFB3+wh4g2A3yd+o/UcT+o6v7fj6AFL6qO2zXWhICTbvF2D9F3CNb5q0F
         onGyUi2yK4n3g3MufJChj+Q/v4bN3sKAc6enG4HUhFpOvrK+uEoPvROckOVpY6IgVFkl
         N9/pinxOesUZ/EO1y/20nEV4nlV7iMf3F2WWUYy6YS55H4eUlWtX8xt+/YFKc65XYy5j
         4XocIYykkO6ZIMWEsZuyVS8WtenSzZZCUA0Eo5JAVh7ueawDD2qhnlqYcsIJH9yQGkCf
         zsoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729183941; x=1729788741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U7CvCYGjKt8zciHXkg8ASuf8k6xH+BAXoknwZwwlr4A=;
        b=v6R7nl7DavFd4KpmRowYppMphGkiFtwvQECAReuMwX5BgibIm/Lt8wfLYqmGZAdzri
         nZm5v/hTive2osYXuLI6HVMaUJNXwnN8klqY4wyLhFd/tLnzJx6NMxRkWHKy4WePD0X3
         ui4OFvo5A+Emue35rJ9a0BsyOQQvTxcl1KrchVr1iOOd/cM7n4eni4xF5+QFCJpD//9I
         6O4gr8GJs3YX/zuWiJvBbA6ZGefxaTeoeMhaWkTB3iW7MWdwunarmfDd2r/Od82ivQWj
         2tpbKJmeOgubE1zbbTOzjkCojn5bsmU6Baw+D8PmbyWJx7bUYXX/72VSGzv+cSUPjVhb
         w0GA==
X-Forwarded-Encrypted: i=1; AJvYcCVVpYhkDTRotKtFnLFJO/ZUOXbewidtnJQyV/qrLQQywMkv0p87sZ+gtE+id6R9OAxWSdwm0iiavU9+EGs=@vger.kernel.org, AJvYcCWK80CcuhfbpzoZK8J1A4jvdOeiTFavg62ZYCB3eFlVeVQzx09W6bmiqGJ9Iyn8Yp/iwcxTfFqXaQcbHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCabEYMRsFRiA9dfaEH3C2Z0HVNQcGkGNr7hrZ51P8eR6pusXw
	BAGdk3xX4VhmN9pxEVaxvqwdmMuywsJ4yjIGEMfTcLOv+Hi57X5xfO+WgARIf22P+0dkDOULiKH
	l1r2yzCzu3fWdbACcvIWn9umFC1Q=
X-Google-Smtp-Source: AGHT+IFk8WzK+un88G9pRHBn18whdVhBK3mtlGg/H5VRqR5nRNbev0Z7d/39H09dc53+bOI26kJVVo/jm1cvERawCIM=
X-Received: by 2002:a05:6402:35d3:b0:5c8:bb09:b417 with SMTP id
 4fb4d7f45d1cf-5c95aae07bdmr15164171a12.0.1729183940649; Thu, 17 Oct 2024
 09:52:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241017194358.4e670183@canb.auug.org.au>
In-Reply-To: <20241017194358.4e670183@canb.auug.org.au>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Thu, 17 Oct 2024 21:53:18 +0500
Message-ID: <CACzwLxgCAweP=VKcmyzHDib5Gx6t7muqEq8rOvcbKp57doiNmw@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the mm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

T24gVGh1LCBPY3QgMTcsIDIwMjQgYXQgMTo0NOKAr1BNIFN0ZXBoZW4gUm90aHdlbGwgPHNmckBj
YW5iLmF1dWcub3JnLmF1PiB3cm90ZToNCj4NCj4gSGkgYWxsLA0KPg0KPiBBZnRlciBtZXJnaW5n
IHRoZSBtbSB0cmVlLCB0b2RheSdzIGxpbnV4LW5leHQgYnVpbGQgKGh0bWxkb2NzKSBwcm9kdWNl
ZA0KPiB0aGlzIHdhcm5pbmc6DQo+DQo+IERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX1RX
L2Rldi10b29scy9rYXNhbi5yc3Q6NDEwOiBFUlJPUjogVW5leHBlY3RlZCBpbmRlbnRhdGlvbi4N
Cj4NCj4gSW50cm9kdWNlZCBieSBjb21taXQNCj4NCj4gICBlOWU4ZjNmM2VhZmQgKCJrYXNhbjog
ZGVsZXRlIENPTkZJR19LQVNBTl9NT0RVTEVfVEVTVCIpDQo+DQoNCkhlbGxvLA0KUGxlYXNlIGFk
dmlzZSBob3cgSSBzaG91bGQgc2VuZCB0aGUgZm9sbG93aW5nIGZpeCBwYXRjaCB0byBmaXggaW5k
ZW50DQppbiB0cmFuc2xhdGlvbiBkb2MuDQpTaG91bGQgaXQgYmUgc2VudCBhcyB0aGUgc2VwYXJh
dGUgcGF0Y2ggYmFzZWQgb24gLW1tLXVuc3RhYmxlIHRyZWU/DQoNCmRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9UVy9kZXYtdG9vbHMva2FzYW4ucnN0DQpiL0RvY3Vt
ZW50YXRpb24vdHJhbnNsYXRpb25zL3poX1RXL2Rldi10b29scy9rYXNhbi5yc3QNCmluZGV4IDM1
YjdmZDE4YWE0NC4uMjdmYjc2NDUxNzRkIDEwMDY0NA0KLS0tIGEvRG9jdW1lbnRhdGlvbi90cmFu
c2xhdGlvbnMvemhfVFcvZGV2LXRvb2xzL2thc2FuLnJzdA0KKysrIGIvRG9jdW1lbnRhdGlvbi90
cmFuc2xhdGlvbnMvemhfVFcvZGV2LXRvb2xzL2thc2FuLnJzdA0KQEAgLTQwNyw3ICs0MDcsNyBA
QCBLQVNBTumAo+aOpeWIsHZtYXDln7rnpI7mnrbmp4vku6Xmh7bmuIXnkIbmnKrkvb/nlKjnmoTl
vbHlrZDlhaflrZjjgIINCg0KIOaJgOaciSBLQVNBTiDmuKzoqablnYfoiIcgS1VuaXQg5ris6Kmm
5qGG5p626ZuG5oiQ77yM5Lim5LiU5Y+v5Lul5ZWf55SoDQog6YCP6YGOIGBgQ09ORklHX0tBU0FO
X0tVTklUX1RFU1RgYOOAguWPr+S7pemBi+ihjOa4rOippuS4pumAsuihjOmDqOWIhumpl+itiQ0K
LSDku6Xlub7nqK7kuI3lkIznmoTmlrnlvI/oh6rli5XpgLLooYzvvJvoq4vlj4PplrHkuIvpnaLn
moToqqrmmI7jgIINCivku6Xlub7nqK7kuI3lkIznmoTmlrnlvI/oh6rli5XpgLLooYzvvJvoq4vl
j4PplrHkuIvpnaLnmoToqqrmmI7jgIINCg0KIOWmguaenOWBtea4rOWIsOmMr+iqpO+8jOavj+WA
iyBLQVNBTiDmuKzoqabpg73mnIPliJfljbDlpJrlgIsgS0FTQU4g5aCx5ZGK5LmL5LiA44CCDQog
54S25b6M5ris6Kmm5YiX5Y2w5YW257eo6Jmf5ZKM54uA5oWL44CCDQoNCg0KPiAtLQ0KPiBDaGVl
cnMsDQo+IFN0ZXBoZW4gUm90aHdlbGwNCg==

