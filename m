Return-Path: <linux-next+bounces-9156-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7303EC7E447
	for <lists+linux-next@lfdr.de>; Sun, 23 Nov 2025 17:39:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30E2E3A7B93
	for <lists+linux-next@lfdr.de>; Sun, 23 Nov 2025 16:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 937E82066F7;
	Sun, 23 Nov 2025 16:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ri62dhWC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B60B12DDA1
	for <linux-next@vger.kernel.org>; Sun, 23 Nov 2025 16:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763915961; cv=none; b=U8tt3hLuWGafiyWldEw9zrMpuNTRZZ0W5smdB2ZbrmFW3refUaYKzX0FfsbHyvVJRrrXpYRJALTFfk/d2HtToCvcSToWKfBWSNZvu1EeeULjCKWd3ug16TxmPM1v2bHMfY4XubP6ak+RIT3S49vcgn87KTwNPeEffzFW4eSLAgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763915961; c=relaxed/simple;
	bh=Yto0JfPMyFhwkyIzlvWFHVypIK+QNFIHz0wUi1GlYY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BWyB5RafkJGwkjHIQFe35TL5hSb0sszBQw97B5PrDdPZ0ieUkdy4dkqL3PlGLQJSk1nq3jDHTW8mZRk5bI4OoMLX84QTMN0ZYFT55YTCWqpbcoBa3I1IiMYPDmuStupeSzMdNnIh6koVFCl6RZ5iEado6HYef9TR92KW/Hn1BlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ri62dhWC; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-bc07266d011so101972a12.1
        for <linux-next@vger.kernel.org>; Sun, 23 Nov 2025 08:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763915959; x=1764520759; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7dbqLePcPBSRLomrj9NiM34uYj5x7cLmIFg/bDccrSA=;
        b=Ri62dhWCvLmHmjdyL2B8NC83kathTEzoNhTcW3ZvuHWiesmeWaIzJd588IGx4OvcTc
         As3c+RjGAr7gqo11tRgnPOdiQV7dcJwvhC+IcahWPiAE9po9A7VCKjvMSNYqZ019nGne
         YjIvmznDfiTTKxLCfSnwMYM7ifu5Uf/968vRQMCrn1UucFPrRtBOcy+zrmFQiz6BkDdc
         lVncXfpGCz5Y8W9Kxh/GY1yDh5b+Y79go53xIqe927Aj972hlOwiYWiHDNCgJT0WE+8R
         aK7BXGGbXVDl/FFC9+0+Prr9bfXXvigNXslBv0FPslYFUhlpjqrT9Ii7Z5ljfJ07eOQr
         uHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763915959; x=1764520759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7dbqLePcPBSRLomrj9NiM34uYj5x7cLmIFg/bDccrSA=;
        b=dGDvwliASAUWr/ZEH2tXdjslz17k+U+hcMd4UhK9Gvs5maRvz7d/1xZDEH1fNkXjjK
         zoiNQ2qeQtJSnb1n9wZaQK/u2bd81PuKxVGXzl28GmcZ86o/hYbhxSGmfIJDS1YOxwLF
         PsHjzmCwXc8WtIPkQ66NHBRWmxLi15plXKkLRc9/eo/lDs16D6eNd06g8ax3OQZnofOh
         USDmDBKtZlakaKQPffayCnSZe4LJ3WniOHn5EUN4uc+PLFyt8xLOlqdF6EI4I4nBqvNo
         dmsGi7SVyXzAVusbrh6myMfzN8ITvmA/F8KSjIsRvSwFhl/EPauz2o2/flZv1x4vYPbh
         7YXg==
X-Forwarded-Encrypted: i=1; AJvYcCXVULh0Aob+f+4X+QnGH7m8XFaU2P4ZF2p0adZrILhMc/jAzTDhcXZgRwp/Xjf/zzJVebzRMybnaz/y@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo+oLBeCvz+7lQYaia/0dGCnjWlOSm9IGYz+VIRGdGWeq9xf50
	O/trGhOIrR7md+u8u3hhPlt28JrJ+lx5SY0FkplCrDIUWoVBEA56bBPOpHK+ABynOsDKaueI2NO
	zdULs5ttzuLMlyw/64EqoImqVxodlgg4=
X-Gm-Gg: ASbGnctIsptF1iITqcoPLKa9mDLYto4JTu82B0Qc4VzRotvVyHn+RUPlRCFFa4uTxHr
	sXGWl8HS5ssQXDCR1ePLqtM5vS940VVgfLPTy0R814GAZVg9qUGbDl5fVIGCCJCUKMeKWwxK/Su
	w+2c7wCbVNH+LDwm3lsNhTO26W9LFvmWY7knWqTGcUdhs6RvfAN0u8qojOJfkluEx35kNm4j3sT
	aStSnZ4G/BD3HR3JqF+qFUqsn7ZO8gHhNRV+UVxpt8kgSlReudbPRRNWBKu8Z/uI7qsEulQFa3k
	sF2p/2yMbqY3oXEI38CfZsDZZjU16M0Riua9/c0nz/W7HarEphuRQovoLm00ei8DtAq17NkWglC
	mRhebIZFUnVCYHWZVohtYY0LD
X-Google-Smtp-Source: AGHT+IFRobeWTpAeddwQ9tNfBbWy8Sdm6sy3VI+FzDR3R3+l7nfnke3R2hRmzQcNjwt7ZhqusRtSerTGis27yMTAPkg=
X-Received: by 2002:a05:7300:ac82:b0:2a4:3593:2c0a with SMTP id
 5a478bee46e88-2a724c02369mr5042366eec.3.1763915959278; Sun, 23 Nov 2025
 08:39:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120181111.65ce75a0@canb.auug.org.au> <CANiq72mW=zMbt2W2Omn4PnMDDJfqz3tDtrneMOFz2ysQ34T8zg@mail.gmail.com>
 <CAJ-ks9=LxO8zTy7rQCiXrZGuwwN5d0gqVkQVE_S2QZnXTdu-Ug@mail.gmail.com>
 <20251121153906.1d306ad1@canb.auug.org.au> <CAJ-ks9k1=BLFCfjVrMqQ5u_ak6+g=HtQ6_TP4ZtazPhk0Z76YA@mail.gmail.com>
 <CANiq72kxj-7VjYp2i2VFU5qoRd6OJKPfajZAg+HMX148DU5zqw@mail.gmail.com> <2025112100-outpour-nearly-b7a8@gregkh>
In-Reply-To: <2025112100-outpour-nearly-b7a8@gregkh>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 23 Nov 2025 17:39:06 +0100
X-Gm-Features: AWmQ_bnEN8KGh7Coj4unmBGCJR4EeBpk76_dKeSHvI8Ra5CEYmt9AdLePiUD1vI
Message-ID: <CANiq72=nS5BVC8zq4tufVWQJt-ZKN9=aSvq1VKxCGOvpuVs6ZA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the driver-core tree
To: Greg KH <greg@kroah.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Tamir Duberstein <tamird@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Igor Korotin <igor.korotin.linux@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 5:07=E2=80=AFPM Greg KH <greg@kroah.com> wrote:
>
> I'll take a patch, thanks!

and

On Fri, Nov 21, 2025 at 8:21=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Yes, a patch would be great -- thanks for providing the conflict resoluti=
on!

Done:

    https://lore.kernel.org/rust-for-linux/20251123163536.1771801-1-ojeda@k=
ernel.org/

I noticed Stephen's resolution can remove an import too.

Cheers,
Miguel

