Return-Path: <linux-next+bounces-8660-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA94BF0E37
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 13:40:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EC1C18A3AC4
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 11:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22F7D2FD1D6;
	Mon, 20 Oct 2025 11:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BIIga+L3"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04371C8611
	for <linux-next@vger.kernel.org>; Mon, 20 Oct 2025 11:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760960414; cv=none; b=Pg8x1AAnRqVwRihWWTWsz/ZYmQIi7B58i8tyxRLwDmdTYtEPYInBoU7UShxd1LgidLComOstjq9jHDUxEhcAd2w0tR2lEy8CEnAX7o2k6KaFEDpydTWGmutIZCK8zDNdFUbMRdRz48jgDPIz48rOMPqBI70htxR3IQLV/V3F1xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760960414; c=relaxed/simple;
	bh=N6Ub8U07IBy/fuFEXEEof+xicUbburBe/O/bkAp8JYE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PpJIGtJ4yKGpJuum4KQZBMs1pE9ShAcZnUiv80BGtlQguGtw5t6lV4Jmy7FUM+hOgIwQ5hsln/VPy506SYOqGkSIWBMmKHuSsKAQO+/heLRxhOaRmfJgykR/bAonUqJ5DCmPp+5k2bO/5pU/tc86Fq4hAz+8lWXqo0rvghrGWfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BIIga+L3; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b47174b335bso265777a12.2
        for <linux-next@vger.kernel.org>; Mon, 20 Oct 2025 04:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760960412; x=1761565212; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6Ub8U07IBy/fuFEXEEof+xicUbburBe/O/bkAp8JYE=;
        b=BIIga+L3efe61QDuCYlEaF2PxEbSOla3K2niXJE5iaNrolmF8ecp3OsuTB8Hf95WVq
         FuLp37A5lBK4KUut1xsHUfLX8ILrWL3AovT6IZlzSfCwD3raJ/msRrh6A0LJUzzT+eC6
         6rGcV8K5RAEOi4a5CMQcgMq4nwmlt8a9Mhh4CaBoXsTgZaNVz92aYc19uhT4QzMJnFxH
         o25wVXUsoDM0G/dPOwDuCNJ0LxUpI8jqMj+fqy6PoW/bKILS7QJscxaAlgDjl4CYcmeN
         2zR446im9oYT0rVk++1n9ZnJ3oIlfV9sCNYEQD7qTGyNAJhaUocCJK9awaZOA2kLyTrI
         C+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760960412; x=1761565212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N6Ub8U07IBy/fuFEXEEof+xicUbburBe/O/bkAp8JYE=;
        b=ItAjk4oLhJcGuA3HwPM2S+HiQeWje06CzhV76tFZwjTxpIJlBB0j4byq+u9pIZK8AV
         A1dHPHfNYiyx4sbIuUDg6aikk12JEVTKXR2Ol3p+/MB9IQzivD18Kef7OlCCbqlIareN
         pDpWaFy3mGFjiKWrzMJ5TujZ2AQJ9x2NOK9B1QCA5DL0ahB0fleP+a3gfGsL8+N1pxWG
         JhYSbLPqEOg/fWNie0FznhzO3EQHfo3TijLG4DMREvfm7LuFk2JmQ1iVsqiGzrLgoKa5
         v57HrKlUWkplDxvuLoyoEah1snraoq72SFOA5F+WcF8z75AKkZMd8heGIpI7EFgJcNlu
         tDnw==
X-Forwarded-Encrypted: i=1; AJvYcCUCh/C5vRnyeLgLalCXkGVewVCGxJk76ldcSsHZAGY0SLdoct7vous4O5PIOmjTZohgUSEm/Vnk67rR@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhyix3oL5XaPFQprjiONmVgE0u6yqyJetQ4ry/Ugea46qs22p3
	/LGRO1c0T6f3MViOu8zGgH8eemRdWzrNn4Nz3/wz0SMuXmSbowlz5n06+8NK7O7/9HEr0czq7Sk
	5eLKjzAUlURzA2/MnfghJqaPMkYJME1I=
X-Gm-Gg: ASbGncsZBbNOMj7kPD3X7PHR0mZSQZX9Oof4FKl1vVF+/qmyvQg+N8GieANk14xpq61
	RbjkMLFK6TUIbRCwJ8gmbkW24HbQ+MeCEhGTGXIlDCBCNrNaMTlnkagD1MXCMChDoAf5nZRgtNU
	Y4th+Jh1wKpOGcZyv+0bVVhvk7x8WBFO0u7A133Sj1R+ZCJxfoTBERk1Y9PfVDYijPS7GD8Igqf
	GKtke31jTQs1vLl9IEMPKPzmkQEoWkNDtDaaXc0QEzrmfRoGqdrFCNpZK9V/dmMvzds+/fbpaqw
	haebpRchvVSp3WOdtEqPuNZzpFuFXc5tFRvbmfFW/3OvdsJHO9OsrA1Kfn/BtrfvcpvT8KvNK+u
	fCAF2QOp7N+A8CQ==
X-Google-Smtp-Source: AGHT+IGSaSv8hgjno7iKSEHfDTg6K0zXC9sATuT4+4URstT3UCuS9sw6Bz3LqHlG6Dl1DGsrxosXOZgOvaTzVn8NlvQ=
X-Received: by 2002:a17:902:eccd:b0:290:ccf2:9371 with SMTP id
 d9443c01a7336-290ccf29388mr104445095ad.0.1760960411889; Mon, 20 Oct 2025
 04:40:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251020123907.13e15922@canb.auug.org.au> <CANiq72kHWgsvmxPYSAHpM5HaxCSf73t4NkPsBRXiPMTTe_u51w@mail.gmail.com>
 <2025102057-wolverine-morbidly-7f51@gregkh>
In-Reply-To: <2025102057-wolverine-morbidly-7f51@gregkh>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 20 Oct 2025 13:39:59 +0200
X-Gm-Features: AS18NWDQjEalVX5boZ81nA2NT3g9faKnXRAIFq7BBrOXYhbDJGLsy1YiU_9WypI
Message-ID: <CANiq72kBYQM+McLJUVedsC_ZoE90EG8mkAMcQDKHgUhaAip7Ww@mail.gmail.com>
Subject: Re: linux-next: duplicate patch in the rust tree
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Miguel Ojeda <ojeda@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 7:30=E2=80=AFAM Greg KH <greg@kroah.com> wrote:
>
> Yes, will send those fixes to Linus for the next -rc release, sorry for
> the delay.

Thanks, no rush!

And sorry, I didn't mean to be pushy -- I checked the last pulls for
char-misc-linus and saw both -rc1 and other -rcs, so I didn't know if
you would wait for the merge window.

Cheers,
Miguel

