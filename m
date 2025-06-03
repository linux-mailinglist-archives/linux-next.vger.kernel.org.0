Return-Path: <linux-next+bounces-7041-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B5BACCFDB
	for <lists+linux-next@lfdr.de>; Wed,  4 Jun 2025 00:26:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91CCF3A32D6
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 22:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B24422541C;
	Tue,  3 Jun 2025 22:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BIoX8otJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB99518DB24;
	Tue,  3 Jun 2025 22:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748989589; cv=none; b=LqxBBZtM/csuFlmaCwzjRAB+Had0XUxsgmbWceOlp77dOXNXK1enSuUIBgWgD2enHlZR95fTuVa1WMXogjUs+UXGReDaKJgRdQrY+Zrcs6JUFevKvYUfT2IJTnm6Ssdw6jimhoQuQhkr8U1dVdXTQ63bZNgO4OYIe6+/o/UrcKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748989589; c=relaxed/simple;
	bh=zfz0c69FmOJCdnkXBAWjeZ3ec55qgxSzUQXGbh7JbEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F3Yra8inr9ft494GnqlrvU5bG7Z7luGCSKt2mY6pIeeTAyQ0YSKJopcqypRW36C3tFEhXe2jwpDIYEuY10rRfkCBDTSdiK0RR0qZRBZLNUrJrXCiYJyjomJYYDvr6/Z6oVGycZFV+UqyVWi/gVx7SsWXXUIgowMh5e3GX4wXEcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BIoX8otJ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-23519817b57so4993005ad.3;
        Tue, 03 Jun 2025 15:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748989587; x=1749594387; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spS60ybMSuhEoBnhprr08UeCQOS996miorjWsXmMPCI=;
        b=BIoX8otJihRarstr08r5VaWztJTwd6L7Y8CvA3Lkmh3CdBfnvC1hsnQeiouR7DtJCl
         CVCL25X/2tZWkrmyJt7q6k8kuiXS+Yz5pgidkUzkZ8Fnlo0HqSSb9p7T7ClIMzba5569
         et+7pYDdDORFZMW/GabbncslrW1L2bu15LzlwKjuh8VbmcBw+yin1/1GjUdpq8yaK5C/
         tPEXrcNfUSLdF/dn9gg8hSudZd7XzLdqrQQDJyvxxTvXNssQH1Z/V4maZ7IJKC3XMuvj
         dx/WSuwTxMaV0I7PAOYB38dP75JihtCehHdcHVKT6ovWadQPHZd6DNnw9/QBqwTo9kOd
         Bzzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748989587; x=1749594387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=spS60ybMSuhEoBnhprr08UeCQOS996miorjWsXmMPCI=;
        b=YKqlmDCAX6AZgQiP3ujmRnVUSoyOTirCwYBkA2fmmtIqjOjkhRKTcUr3JCDNI/dHmY
         iCaG+i11Vh9+LHMm4BDAQXm2TPQsbEu0yc63xdUY7T4l+ns5KxhlAdcF1UNieLt2mwyd
         Atc1mHC2iUZwXU1jzMSzoOUlFXBDs151Ttacb4wCHn6pyu3I+XX4JgeVM4D2IalwE70O
         XAtm/QJXTx2yxVPZub9KayQ/LD5ZQ5IvF9H0H9DDR1TRJ1WgwphV3xNN1V7QizeIpuh1
         kh/EmnLYzXd9UibUELF+6jl6zd4moC26qM33hJFTgkorYTzsdhkR5qYm6vCG0ZzqibaN
         psvA==
X-Forwarded-Encrypted: i=1; AJvYcCUwVuKap2eE4f3ZoFHhL17nh5+ND4qkJ09tAAjgxabuMN2MxZenE6SKKYXgTGpzp3EZaQRyFpcnuCDRvmo=@vger.kernel.org, AJvYcCW9TRk6xAKoIWzRdfo2pDmR462cswl9HtZ8QQpVuwlRybXuKLAvO8xUMPsXtb3GCKCoVrZ+FLUNyRLyoffyHkg=@vger.kernel.org, AJvYcCXbv2Efn2nu7ytkCRYvgGvfjahZmNxeMQAjFxVYnFhvVA53u0K0TkEVtUS8V7LGDh/J7L/OBKjZnFtUqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwP+5NMjJhjwte30UTmTqfA9VuJyikZoky+cHQjbBLLNJosFK+L
	WQk+vv6tYhNMDj7n7CrZ9EBgZwAAXAdGC6ei9QN6aBzlOzbXbZWP7VIGKrBE/fc3fHgmIm20aLN
	rRT5saXxHdO6gn1ASFCrhZcLKKZrfwaY=
X-Gm-Gg: ASbGncvRwAu2l+iIQjbTcBth9WaRUcatvUDT4wzOl3Fr6TItA+35S5yL0TxqSSvp9em
	qT4zAQZW10quKBlovctYEJJzUVF0ORNpuu5hhg9a5aGrpXRNRKb63smzH0PRl8u29OxWFfZhCjo
	4TKjfvAvKwcTc2zEPzIbn8sa/9xihSov22
X-Google-Smtp-Source: AGHT+IHYe4MifwZmarTiGrmPgQXYs94V6HqZaBrwfAdvRpZP4olnAr0bDFZ1PORuNElDs5cZ2+9XBUxmqKGqQyL6VWI=
X-Received: by 2002:a17:903:32cf:b0:234:c549:da0c with SMTP id
 d9443c01a7336-235e0f37687mr2464635ad.0.1748989587025; Tue, 03 Jun 2025
 15:26:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <700ebe13-c2d3-48e3-800f-8dc327efb6fc@gmail.com>
 <CANiq72mFL4dn+0JppLLfxyKnM+xYwKeduFw2j07hUfxWVVHdUw@mail.gmail.com>
 <f5d5b84c-0850-4df9-bad7-61fff12c4248@leemhuis.info> <CANiq72=+qUNJu5j+uoveMrTbngwA89+ScwjUPd9OyVGqps54aw@mail.gmail.com>
 <20250604073118.4205f303@canb.auug.org.au>
In-Reply-To: <20250604073118.4205f303@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 4 Jun 2025 00:26:14 +0200
X-Gm-Features: AX0GCFsOpisR9zReSwsbnHOeUt07nmPeJXowIYZoqNdvdu6R35lnffHM6XE6fuk
Message-ID: <CANiq72=EttF8tieqakoyYxfu_-LyUjCTcaogtO-Z1HajGx7LMg@mail.gmail.com>
Subject: Re: REGRESSION: armv7 build mismatched types
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thorsten Leemhuis <linux@leemhuis.info>, linux-kernel@vger.kernel.org, 
	Linux regressions mailing list <regressions@lists.linux.dev>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 11:32=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Damn!  I knew I would forget.  Sorry about that, it will be applied
> today.

No worries! If you prefer that I send a reminder in this kind of
cases, I would be happy to do so.

Thanks!

Cheers,
Miguel

