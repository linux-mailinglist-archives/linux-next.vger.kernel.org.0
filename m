Return-Path: <linux-next+bounces-7486-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0634B018B4
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 11:49:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93684B47023
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 09:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6831A27E06D;
	Fri, 11 Jul 2025 09:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gf53ONHc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CB827C15A;
	Fri, 11 Jul 2025 09:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752227332; cv=none; b=a9jfc0gdtUOEHRs+P6fQ+QEjce/VcYwMxn1uQb9GTZZQUwsfaK7DTHQjqWlBKk/0F1U5MGwdIhZCZQSVx1Ppe6qqpEcdNvqoWZa7yDNliVvGRemYBoKGiRw815xaORKod9VBRRQfaZbaml/XhrptsI/TNSQkrFdJ1ao3PAD4n+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752227332; c=relaxed/simple;
	bh=I2FaEcC7Ih3PzlnC0Nt1208jKJLVfP/3huoCAj1lAo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tM/e0S/gkdZj9GSvZ6VTwRxr4M646+vNsg7kRfWd2zMlkp++2CpEFcJKemKIwwlMESiiFM+NHeGn0yroT5UEcRqD+NHF+awp6lqUyrxH0TOdjch2NZy+DgdeRKavWYPMGnYuO9zUe1RWZIS2EUTYzJAo1GBtM0+Li7NTRoJDWEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gf53ONHc; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-313756c602fso299603a91.3;
        Fri, 11 Jul 2025 02:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752227330; x=1752832130; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gfJJBjb3kYwyR5vQxYpDDq46yPtGEDQ/xntQbqbYujk=;
        b=gf53ONHcpNbHDlf8RKb1bbTSdhP/iskgyAuw4Nomb0SvEwmN/bPoOEwKi2KmYdKG8i
         WqTIqcvtpMTofoCGUwLTUU1Nu3HlPFX7FJPu4jz52g/pF1+Eu9d1qkKwjpC0ybAF1tkC
         Onq/PK2kxi4VpX0UaYYkZt+oX/Z21xjWyXs1iNZ8al9z0EDXoSudDFie7ET6gY+gVdT0
         2/+uxj94Zg3issvt+5SwXzqyNDV7eb7X/ca7RNMb1O7GWlSVkKnNQIjEL1I/bny4cfpR
         wxjPgblxoE4IPLBdN3J/IVzj8tZK7j9as+phjbhpTNAsO2ueOIMwWsI1/GzkybP54H86
         l+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752227330; x=1752832130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gfJJBjb3kYwyR5vQxYpDDq46yPtGEDQ/xntQbqbYujk=;
        b=G/SaEBN/ykmMCMYJXw3rRM+Y3n4FcVJ56fnub9sA6+WBfi/zD3CvF9XTk+PaQEg7fC
         PV3pY8aVv4z2+00buUz357rZ5dg4VO3jeni/yjXZRaNK5v+8Wg+FZsmq3ilRqNbdoSoy
         8GSd7CRRWGaHGxhQ3hBeHBfqtzf5iKP1+Ey16FKaYPPRAYIuxpiEI3J4k+Aly7PhBFmh
         jASTkrWniXwo+6jmjCbrDpWN62IehEiwa7yYUdM6raDGNFMeMMk3/rkeWLMnu/4Nby+z
         B3+KypmjBT/2KNYMUvJol7x2mKpnl9Zy35LZs9w9Xz2NOo6ENq95NVe001X75+YFw0oi
         8tWA==
X-Forwarded-Encrypted: i=1; AJvYcCX9iPp0MWBP3l/k7QevF3hvSFwoGu+fLlwmZq9zvCHferaX4teDSShwx70vc9TskMDRLAiwaFhAWGx8mbI=@vger.kernel.org, AJvYcCXPaDdZjjPV6FS6so5kZBL2IkCVne8FKKIgQy7VUn0nFHDsBOyMMWwyLmz3l2dH3ztm2XWDxYXDFmp+MA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo/2ooITyV50JNzefBRsBGfXuvhLoqsCKK8OgnfewDBR/Wwuuw
	Mv3/ZtyS7iB/qusXRaRBuB0uW0MvEIMyh0hIgTecQPcIO/vn6osrEjb3sMkQj8EMnTqtVBZNv7s
	p0aHKEW4wPwvHFxlOMsNzDipwHJHlvqQ=
X-Gm-Gg: ASbGnctuuL95E3sxfst2g6o0lRNoR5/p009We2LywLIGn1fOF/mF/yvRCFE6ymLHi49
	WfeHMX8SVB/UWKNwwmocWh6i7TD1VnlvKLLo8VPN5CVsimA38uodW+YI1oJAoS6kLqKYh97bNGJ
	9CyPMblKabqemIJ7IQvBBcL2wzEZ36AWF56I7iRO5g0ROMwtnrJjkZWpqxOG3NtHeNxmhqraOs8
	BgOnxo4vDPWwPkQE7U=
X-Google-Smtp-Source: AGHT+IGY4l81I5u7Jr/6T37IBrH2oCY6/Y62Ca9ajc4f2dqAKj2+4zp8HFjDH+v3h957cY8eQq2Nye4jeySj8RZyQsU=
X-Received: by 2002:a17:90a:e7cd:b0:313:151a:8653 with SMTP id
 98e67ed59e1d1-31c4f57d98cmr1146981a91.8.1752227329995; Fri, 11 Jul 2025
 02:48:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250711175909.75aed946@canb.auug.org.au>
In-Reply-To: <20250711175909.75aed946@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 11 Jul 2025 11:48:37 +0200
X-Gm-Features: Ac12FXy0A9wN23-qRFyVD27_7OJJ7PEq8fhDLqK6XpPszdaAEr14qwx3O8j529o
Message-ID: <CANiq72=0cC65wmsPuwnoUUDJbUnyxjPKimtr_8GOQT6d=vOCWA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the driver-core tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>, Danilo Krummrich <dakr@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Tamir Duberstein <tamird@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 11, 2025 at 9:59=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Today's linux-next merge of the rust tree got a conflict in:
>
>   rust/kernel/pci.rs
>
> between commit:
>
>   4231712c8e98 ("rust: pci: use generic device drvdata accessors")
>
> from the driver-core tree and commit:
>
>   fcad9bbf9e1a ("rust: enable `clippy::ptr_as_ptr` lint")
>
> from the rust tree.
>
> I fixed it up (I used the former version) and can carry the fix as

Same as Tamir mentioned for the other one (`platform`): the former
removes the line modified by the latter.

So it looks good -- thanks!

Cheers,
Miguel

