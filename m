Return-Path: <linux-next+bounces-5965-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CC0A6DE43
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 16:20:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96473188CDA7
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 15:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6807525DCE5;
	Mon, 24 Mar 2025 15:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O8V0vd2A"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FC32A1BA;
	Mon, 24 Mar 2025 15:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742829535; cv=none; b=rD7MGonJBAt2Jy3DRD5OHvDrqQfEpulxnMV2g88qYksnHzW61dln9h8uVp6MvjfkdYz6wxvz2zJOF+vDph+IuW0g/kdHYb81VYjfNxyOAm/OoP+I1SyySbZNYlycJSmb3j1tK9AKsA37ZN59z2W/m8Jvm0MNsKjML9fQAZ/hhi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742829535; c=relaxed/simple;
	bh=7qldwG97RgKzbo+9R7bW0qG7TOIAkqe2ss3aTp0sM5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YUwGzm8ULzya09DMlftLhQs+gQgOPooZ+1EBDrYqrker9LDOtgmlKxXh3lkEjOiQO8YvwyQXk3dIdEZ5KGs38NXaNH43fW1VxJtpE8h3Lp/O71RbtXAUcegrbVlMYwK13SZvWJAD1wzuFc9+0eGOdTkuzBuRI4PrSKT1VNH123M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O8V0vd2A; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ff62f9b6e4so1425754a91.0;
        Mon, 24 Mar 2025 08:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742829533; x=1743434333; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RO/O+X3ZpSBE6bujfte2mw8/TyRjxpx3CWANRtb+DaA=;
        b=O8V0vd2AYqZfcfShhcGUHLUWHlVHQLjTUtVOZMFXFhTbNAaNDkQWa4khVL4Tinccnt
         XbVG12YVkZ7fcyexfGOvbV5P2WKw1klmIPHjeeIlIYP8Wx1NJmeLGygiWnHrQ2NR9drz
         FIyiUayeCwG7x1lIteq9Fvx+A4unAl9MABWCaE9yjw77CLv6W7yy5GxIPgBGRbaBxdJe
         ER8EgCIjBvO5Rx0qkZNaK2pbQmyOoxHbEDDHKSiniYKF0KusQxnnHQ+DWF97VaVlFVGs
         GPCrsz5UIa98NMz6o1OY15SYwbgkOfFsyGRAIIh4sStlGzJEkadIrHVm7id6Yvr0vKqu
         h1cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742829533; x=1743434333;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RO/O+X3ZpSBE6bujfte2mw8/TyRjxpx3CWANRtb+DaA=;
        b=MBbLqutRRABceBbUssSbupzPsMa7FcxL2WUKyAGqwWWEmb9WN5tePCP+DskEVgtUIR
         z2E3uLosozFGd8AfEURfCcttRSBbLs/EviikEODzJOW6cOs5XwXOpvMWKejQhmCrj/kt
         j/la3AyflaRXFWl9Fpmw2rlUWuUTViw7BLnuSp2+GT2bHVgY/2Yj0LovEpTEBrmGJS7y
         g0Wbmn2Zp8J2Y0pG5gQ1VLNIVHq8vhlxRfRiosH5I5uGq0SOle+ooktI5WTSO3NmpiGK
         qFrso5pZ4NFIaKRbDE8FJc9ZVOsgnAHKIAmOvOlgT9UVw8NPaf515MrTTp2IEC/0nj6d
         ZdqA==
X-Forwarded-Encrypted: i=1; AJvYcCU3BarrKslvShuugUfXQ7cBptVR+gCHSIk3fVr3Jz/bEwHR1RUoKynUicBkg8RPtBbTrRTNbO/vJxw7DQ==@vger.kernel.org, AJvYcCUXY0/13sk9pEm3hLIPcGE8C+5gPfKAZQvr8hn3ukoxAzLaXfBpooNKnJiKOZpIvKz61PPfYPWPQholyLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvnMuhmy1dJNcMy7a7SgO45E3gjqyixf3DTGjMMa+zhZnglizO
	FnJX1JPq5SKLmY+4mewZN10Pp8Cmw09bwIh4GaeHO5CWUg+v+rDsgBqrCfzKHR0v3p0Bur//m4a
	KpxKLNjelBnTEKuUCcafoLecUTXk=
X-Gm-Gg: ASbGncumt7NsYrB2LN6WPhJh+9of3AdPNxS1uB3C54hBH8+ibS3OsYrOnaShT5PrwpM
	5MynQ/rysC7VQk5+KWqOaJHyf4a1LMnPiWh91bweRh9Z8iTMqbaWyCFRUJkj6PH3jJ7A2cKYLAf
	XQ8fgewXIrjUUSHCVeIor/9WSM4A==
X-Google-Smtp-Source: AGHT+IGv//TNyMwTptj2LukCFA3IACfBaFPXo3cfelCELNwfuuq5uecen5C0xSIOKBuosyTMeHw0TdvP+zCtgvq3xlM=
X-Received: by 2002:a17:90b:33d2:b0:2fe:91d0:f781 with SMTP id
 98e67ed59e1d1-3030fe534b9mr8004795a91.2.1742829532854; Mon, 24 Mar 2025
 08:18:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324215702.1515ba92@canb.auug.org.au> <20250324220629.1665236b@canb.auug.org.au>
 <Z-FJH628-j2HCuaE@cassiopeiae> <2025032443-recharger-legacy-93bf@gregkh> <Z-Fhf3Cn8w2oh1_z@cassiopeiae>
In-Reply-To: <Z-Fhf3Cn8w2oh1_z@cassiopeiae>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Mar 2025 16:18:40 +0100
X-Gm-Features: AQ5f1Jqjz7SmxgftEFXbxo0zTStea1KSXA_2LDRC1NRQdmMwTAuqW8ZOx_PqW8E
Message-ID: <CANiq72n3Xe8JcnEjirDhCwQgvWoE65dddWecXnfdnbrmuah-RQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the rust tree
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Miguel Ojeda <ojeda@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: multipart/mixed; boundary="00000000000035dfd40631181f54"

--00000000000035dfd40631181f54
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2025 at 2:43=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> It's the DMA commit that has a bug, that was revealed by the fix in the
> driver-core tree. So, the patch to drop is in the rust tree (not sure if =
Miguel
> changes history at this point though).

Just to double-check, the diff you show below is the combined one,
right? i.e. it is the one that Stephen already had the previous week +
the fix you posted above (`Send` `impl`), right?

If so, I think it is OK, and we could put the new `Send` impl on top
of `rust-next` -- given the trees on their own are OK until they
arrive to Linus, I am not sure if it counts as a fix.

i.e. something like the attached patch (crediting Danilo and Stephen).

Cheers,
Miguel

--00000000000035dfd40631181f54
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-rust-dma-add-Send-implementation-for-CoherentAllocat.patch"
Content-Disposition: attachment; 
	filename="0001-rust-dma-add-Send-implementation-for-CoherentAllocat.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m8n7mwkw0>
X-Attachment-Id: f_m8n7mwkw0

RnJvbSA2YTE1MmFmMjNjYjQ5YTNiY2JiOGM0NDU3YTYxMmZmYTI3ZDU0NjkzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBEYW5pbG8gS3J1bW1yaWNoIDxkYWtyQGtlcm5lbC5vcmc+CkRh
dGU6IE1vbiwgMjQgTWFyIDIwMjUgMTY6MDE6MDAgKzAxMDAKU3ViamVjdDogW1BBVENIXSBydXN0
OiBkbWE6IGFkZCBgU2VuZGAgaW1wbGVtZW50YXRpb24gZm9yIGBDb2hlcmVudEFsbG9jYXRpb25g
CgpTdGVwaGVuIGZvdW5kIGEgZnV0dXJlIGJ1aWxkIGZhaWx1cmUgaW4gbGludXgtbmV4dCBbMV06
CgogICAgZXJyb3JbRTAyNzddOiBgKm11dCBNeVN0cnVjdGAgY2Fubm90IGJlIHNlbnQgYmV0d2Vl
biB0aHJlYWRzIHNhZmVseQogICAgICAtLT4gc2FtcGxlcy9ydXN0L3J1c3RfZG1hLnJzOjQ3OjIy
CiAgICAgICB8CiAgICA0NyB8IGltcGwgcGNpOjpEcml2ZXIgZm9yIERtYVNhbXBsZURyaXZlciB7
CiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgIF5eXl5eXl5eXl5eXl5eXiBgKm11dCBNeVN0
cnVjdGAgY2Fubm90IGJlIHNlbnQgYmV0d2VlbiB0aHJlYWRzIHNhZmVseQoKSXQgaXMgY2F1c2Vk
IGJ5IHRoZSBpbnRlcmFjdGlvbiBiZXR3ZWVuIGNvbW1pdCA5MzVlMWQ5MGJmNmYgKCJydXN0OiBw
Y2k6CnJlcXVpcmUgU2VuZCBmb3IgRHJpdmVyIHRyYWl0IGltcGxlbWVudGVycyIpIGZyb20gdGhl
IGRyaXZlci1jb3JlIHRyZWUsCndoaWNoIGZpeGVzIGEgbWlzc2luZyBjb25jdXJyZW5jeSByZXF1
aXJlbWVudCwgYW5kIGNvbW1pdCA5OTAxYWRkYWU2M2IKKCJzYW1wbGVzOiBydXN0OiBhZGQgUnVz
dCBkbWEgdGVzdCBzYW1wbGUgZHJpdmVyIikgd2hpY2ggYWRkcyBhIHNhbXBsZQp0aGF0IGRvZXMg
bm90IHNhdGlzZnkgdGhhdCByZXF1aXJlbWVudC4KCkFkZCBhIGBTZW5kYCBpbXBsZW1lbnRhdGlv
biB0byBgQ29oZXJlbnRBbGxvY2F0aW9uYCwgd2hpY2ggYWxsb3dzIHRoZQpzYW1wbGUgKGFuZCBv
dGhlciBmdXR1cmUgdXNlcnMpIHRvIHNhdGlzZnkgaXQuCgpSZXBvcnRlZC1ieTogU3RlcGhlbiBS
b3Rod2VsbCA8c2ZyQGNhbmIuYXV1Zy5vcmcuYXU+Ckxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LW5leHQvMjAyNTAzMjQyMTU3MDIuMTUxNWJhOTJAY2FuYi5hdXVnLm9yZy5hdS8K
U2lnbmVkLW9mZi1ieTogRGFuaWxvIEtydW1tcmljaCA8ZGFrckBrZXJuZWwub3JnPgpTaWduZWQt
b2ZmLWJ5OiBNaWd1ZWwgT2plZGEgPG9qZWRhQGtlcm5lbC5vcmc+Ci0tLQogcnVzdC9rZXJuZWwv
ZG1hLnJzIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvcnVzdC9rZXJuZWwvZG1hLnJzIGIvcnVzdC9rZXJuZWwvZG1hLnJzCmluZGV4IDlkMDBm
OWM0OWY0Ny4uMThkZTY5M2M0OTI0IDEwMDY0NAotLS0gYS9ydXN0L2tlcm5lbC9kbWEucnMKKysr
IGIvcnVzdC9rZXJuZWwvZG1hLnJzCkBAIC0zMDEsNiArMzAxLDEwIEBAIGZuIGRyb3AoJm11dCBz
ZWxmKSB7CiAgICAgfQogfQogCisvLyBTQUZFVFk6IEl0IGlzIHNhZmUgdG8gc2VuZCBhIGBDb2hl
cmVudEFsbG9jYXRpb25gIHRvIGFub3RoZXIgdGhyZWFkIGlmIGBUYAorLy8gY2FuIGJlIHNlbmQg
dG8gYW5vdGhlciB0aHJlYWQuCit1bnNhZmUgaW1wbDxUOiBBc0J5dGVzICsgRnJvbUJ5dGVzICsg
U2VuZD4gU2VuZCBmb3IgQ29oZXJlbnRBbGxvY2F0aW9uPFQ+IHt9CisKIC8vLyBSZWFkcyBhIGZp
ZWxkIG9mIGFuIGl0ZW0gZnJvbSBhbiBhbGxvY2F0ZWQgcmVnaW9uIG9mIHN0cnVjdHMuCiAvLy8K
IC8vLyAjIEV4YW1wbGVzCi0tIAoyLjQ5LjAKCg==
--00000000000035dfd40631181f54--

