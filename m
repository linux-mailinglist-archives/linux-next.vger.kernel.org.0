Return-Path: <linux-next+bounces-5215-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F10AA11E93
	for <lists+linux-next@lfdr.de>; Wed, 15 Jan 2025 10:50:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 235933AF167
	for <lists+linux-next@lfdr.de>; Wed, 15 Jan 2025 09:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7910C1E7C31;
	Wed, 15 Jan 2025 09:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="aG6G+v0o"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AD91D5143
	for <linux-next@vger.kernel.org>; Wed, 15 Jan 2025 09:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736934653; cv=none; b=HwjBnOe7Vmx14/ohS1yJbiSlzSHxDpYoy6EftrAe+WdfGxbEYl83dBG9anQcHtaXB+dKkHlOx31MEFV9ZkjJNmLuvMU6EZmEKLe/TgFE1jg0qBLl1hW4DML0yLwt8VEwroYmRyNcEwdxXfl3kV3MwO33g9NlDXBC0F7nA5fDwu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736934653; c=relaxed/simple;
	bh=jPDK61E7J5Vkc/N5MbWJwDXM7VMgCJUrGS059ZyFIOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=czzAooNENFUCfPkN85ipQOoWxeNrApsiMMyhuD+ejwMQ3p6gFM09/sUp4ogIbfdEiuUPKKsbCYzJ4IK+sylWnI6Zii1huh2rdDg5di9EOhPH+GqRSgquxJdcRETgFdRhfs5yUgaBDc/pijQfS2vC47B3VLC3/DFkzlWY0CpNznk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=aG6G+v0o; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-304d9a1f198so54337691fa.0
        for <linux-next@vger.kernel.org>; Wed, 15 Jan 2025 01:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1736934649; x=1737539449; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=69TEX6YNXa4rAOnyFm4GT7og8TluImM2hGF7Ok068xE=;
        b=aG6G+v0omTWcrRgj4MfmP1Y5+SeGuNN/PVn5/9PMIMj0T88yFkIrQgYObs7JP13KdM
         6rkW7PD2hJQpZp8e/BdAJexi5EDl/n17DzNmAkJY0fM/1DT4LdZVdhL2P3nbA/vz3RnX
         nZZY8w0hkhtoLnLX3KN6lCRZuhNI11uxgyaBQelIPAlSmhNR+Q+al4wha/hIQGm5E6tG
         2IaKDS/O3W5bMQ0X0ZslKBsSU0UF46CV9gLwSZvuhtQKSgoUoAABoNRwPCRw7K8X94dc
         1L49emhx1KoY6J9j8aWDEvwoutRY0jN8A0LJX6skiZrCKhDrnlWR4y0EW3/UpidUnt0L
         ZEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736934649; x=1737539449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=69TEX6YNXa4rAOnyFm4GT7og8TluImM2hGF7Ok068xE=;
        b=fbalpzy7OSqkCXZMIA4Oewfa4RPEURdxAWHRfU9kHcL0H4Vfb1NOO6AAhSHJbiF22k
         7ZCpVyDvc5JH18oa4d3lb7DMBRjRmvXoU9DArLEp//eGeguj69oHY/WQXgEPSTDbO3ER
         Nv6qQzJO7IsxaCtOt8gKFfhlkV0pdaXnMGm5MKwfN9vhd17DsszvFTr9POFMCQPj0j8A
         s9m7PhEKLLDR06fyrYm63WyaacseT4UMy1aGyPmDqFKcfOx/KMrXl6V0rCUWxtrjGmpT
         kjEvG2cLafArXzQv96PuGttnvmL9uMKGpWyjMUDXjpBfVmXLVXNwmV1CJLbAC6kREu/0
         SO5g==
X-Forwarded-Encrypted: i=1; AJvYcCVIzL5KkV2Xxo0hF5ytEjn2zejAMBVVGoSVcqUXwY1iXI9aAD2v9GuNoRhq9i/K7qBacgKUAyP5e++n@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj79DYUoHWtNlpuMQOu6KcsxhFpU8iyeRcUpg+oGYXeB2Qz2Rf
	aDp3OIQIPE6WFXHFoxlZ4/MqnKGJMZLhn6iN7yDFci1D4YAhUat3JQBtADBis8Lfjvf9vBzciNj
	kZskYB2RT0YVOhABvChYfvwTPAHk/QNHv73HsJmHO9wic8/1H
X-Gm-Gg: ASbGncsx6ZnwWtHhXYa0LqnJhOkHgBkFHvaCPxjki5c+/rW+m2DdPTthd3TdNYpPbVm
	WUQLHWeeIcQA/xTYnrh7Kwe7uI75VHa9g3s2a7SD9O+2Fxeomgrjo9MC6dxFdOInBIATi7Q==
X-Google-Smtp-Source: AGHT+IHWXGbpQH3cTwl+YZrUApnIX2+b4ltsLdb1KmIlY801cvBfMhssE/TOqFIMj/PNvNQdEgSMPF0ptllKC2lGH/I=
X-Received: by 2002:a05:651c:b0e:b0:2ff:8e69:77ef with SMTP id
 38308e7fff4ca-305f455e290mr92734861fa.1.1736934649144; Wed, 15 Jan 2025
 01:50:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113142640.54d5eceb@canb.auug.org.au> <2025011357-deceased-press-cbae@gregkh>
 <133f3d1c-19b2-db19-f4df-c67d1f57b946@axentia.se>
In-Reply-To: <133f3d1c-19b2-db19-f4df-c67d1f57b946@axentia.se>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 15 Jan 2025 10:50:38 +0100
X-Gm-Features: AbW1kvYuPIBbDOoUOzEhfQFLzqTgAzjVPlryjHkKGItegxDrCU2_F1o_Vxyct5o
Message-ID: <CAMRc=Me19ML8ca7dBL1RZ1bWwBY56V9d5JecMOPhf57oQ1cCog@mail.gmail.com>
Subject: Re: linux-next: duplicate patch in the mux tree
To: Peter Rosin <peda@axentia.se>, Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 9:55=E2=80=AFAM Peter Rosin <peda@axentia.se> wrote=
:
>
> Hi Greg!
>
> 2025-01-13 at 06:20, Greg KH wrote:
> > [You don't often get email from greg@kroah.com. Learn why this is impor=
tant at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > On Mon, Jan 13, 2025 at 02:26:40PM +1100, Stephen Rothwell wrote:
> >> Hi all,
> >>
> >> The following commit is also in the driver-core tree as a different co=
mmit
> >> (but the same patch):
> >>
> >>   49a9b01803e4 ("mux: constify mux class")
> >>
> >> This is commit
> >>
> >>   7685ad5f08d9 ("mux: constify mux class")
> >>
> >> in the driver-core tree.
> >
> > Thanks, this should be fine, I thought no one had picked it up :(
>
> It all my fault. Sorry for being unresponsive and thanks for picking
> the patch. I have now removed the patch from my mux for-next branch.
>
> Cheers,
> Peter
>

Hi Greg, it had spent some time in Peter's branch without ever being
sent upstream so I resent it to you. Please don't drop it.

Bart

