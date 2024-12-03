Return-Path: <linux-next+bounces-4863-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D439E2BAF
	for <lists+linux-next@lfdr.de>; Tue,  3 Dec 2024 20:08:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AC59163913
	for <lists+linux-next@lfdr.de>; Tue,  3 Dec 2024 19:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FE501EE039;
	Tue,  3 Dec 2024 19:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XOlc009e"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72E81DAC83;
	Tue,  3 Dec 2024 19:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733252930; cv=none; b=RfTPzz06H2ADK19+cXzBGNXXc0HaXo+JkDn1a6T0+XZL5mSgVQ5LIUexlaz2JABYDovKCIb9LlpW+bK44yA7dncx8xhCiVv5Ego69cm3z5fjZ7MheAkcVNb9L4evPjoNU17D6WUcJkAaOz/tWjfm3KlaRlHT2m9yAgA3UMbcgWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733252930; c=relaxed/simple;
	bh=kwHZ2se9ReqzDtQsZK8wHA0Yv67BuPV3qm22GpUmXbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IuCn1MINTt8ABDURS7NR8nI1X8g239+FDqfqEySV2s+ck2Ve6Xr/SLYO30A/7rPskMWCWWpNrz0uVXMSz7+cn6wGdvrqoTEmU/pIiGbUjP+WHAwBZTMFDgKCqgl3yPWVbIp09oe+ZDTMtTV/fFrz0LbQ8ziUsKf/kuSwG5YhYbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XOlc009e; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-385e2880606so3889392f8f.3;
        Tue, 03 Dec 2024 11:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733252927; x=1733857727; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o/GajLuB6VlgxqAV+v6t5stEll6kuPWXr5vRdNegYdM=;
        b=XOlc009erRaEMkCc4eXnzzzEdXDI/aAWd5lpi4lDvt1JzSCGsXcAHxJvT1YI253/VF
         WyP+O8ZCsilkg7Vwkd8GDGKSjjdjltkx9L3x3WuVX/LHKlBpqEGN6gIpxXI9bjABPsik
         /+MasR3ajnaEjC2kkvWVFfcP2tGJFuWjLn3yfSE8Suz71LIAD5CqtQS14ueJqeN/DxDV
         5bLV5t5y1YbVxDrJJSaFfBT5CIP0aK8CgHgpR3jdbMLIdyyPF+YduVwfWDI0iIikXskE
         MQTtXl5unc25K6gcHHTj4gcXFab9jYzFTh392EPkV3SqG4FBQZR+O/3AVmJGmVDk8c9Q
         ej2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733252927; x=1733857727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o/GajLuB6VlgxqAV+v6t5stEll6kuPWXr5vRdNegYdM=;
        b=C3s8hxoa5uauqGk4ieU2/chKS4VS+4HASj488rg76QRmNUanWHCZunyQL4nHTc8xQJ
         aKkV/On51QVgWs4aBaUySNOVDDL/BwFr/aOP4fF17DVP3NOcK4qWvCld5ASiU+UX6qR/
         zti1+hWlVhgHlJWEYde15l0PiVidOTO9XtTEzU0oPQj2mtfswT6868uBCaND+EJbAJm2
         MmxaB+etGDTNPbIYsW+NhnYSPNgRj+/ak4KOHM7Jz+raHez/INygMb/0bE6zYfxX0E2O
         Ev7u0Vk03tH2Gl41GXK+HoK8b3dSyTIgf5I7grKpt7vAguWJw2pVWDh0bBg+NsG5SgvV
         +V/A==
X-Forwarded-Encrypted: i=1; AJvYcCWqqU241A3JvwbSCxK1T+kxW5W6iPrjpDx2M4wE6oIAuHXCCC/BaxLuWvPuAV+MPt8dDtcwfaOIHy/Fcw==@vger.kernel.org, AJvYcCXoj0r2k1gm+m62Pri84yehXm5gbZLj48jTJMy6OPh16ode+CPfsaEfXsxI4m5KaK2umLbMYHrInj/2Xog=@vger.kernel.org
X-Gm-Message-State: AOJu0YysMEyhARYdvzRGyXWVi3bea5IfMSB1wA72ZINqnjg4tPgQ0E7W
	jATSUiy0TzprUAeXwHywm3HNs+NXmU4i6XbHLkud84TjlOv4a8HbOOmmh+1m
X-Gm-Gg: ASbGncuEFdSFZhcZN0nH3iiRoZ8s+TgM54rg8YAgJbn+/lTNhs1zCAR4qK5fhXd9AEw
	pfO3T70fdyc+9Y/jN66Z5fN959DwKae59SFSh+fmjlvWTZhu3ToRdfA/gO8YcVaTLHPiXJereEv
	CtJHRGWU6ZUeFoNFnOdYtv8vZHc8bY0pAsuLnAgqFBkmBO6G/fS/+tr9tnSIOcptIfY30s+eqSo
	IOhIIFmA9pUH6VbWdzKkBWW6/SFVONofiEYe2zaRsF3Z74dSQvR7NR+MbVOaiLEGg==
X-Google-Smtp-Source: AGHT+IGYc9RPX2NkOZaoDkqmdJqSrOfqdZfo7T0GZELsc6mADLVQJlkMqsaTP6etJMU8486ex+a8zg==
X-Received: by 2002:a05:6000:4009:b0:385:f909:eb2c with SMTP id ffacd0b85a97d-385fd43556bmr4067289f8f.38.1733252926639;
        Tue, 03 Dec 2024 11:08:46 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e4617a61sm10707452f8f.3.2024.12.03.11.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 11:08:45 -0800 (PST)
Date: Tue, 3 Dec 2024 20:08:43 +0100
From: Dave Penkler <dpenkler@gmail.com>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the staging tree
Message-ID: <Z09XO31jzVdZJzuK@egonzo>
References: <20241015165538.634707e5@canb.auug.org.au>
 <2024101623-education-buffoon-0988@gregkh>
 <Zw_KjYQ7P2Qd8fDb@egonzo>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zw_KjYQ7P2Qd8fDb@egonzo>

On Wed, Oct 16, 2024 at 04:15:41PM +0200, Dave Penkler wrote:
> On Wed, Oct 16, 2024 at 09:40:03AM +0200, Greg KH wrote:
> > On Tue, Oct 15, 2024 at 04:55:38PM +1100, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > After merging the staging tree, today's linux-next build (powerpc
> > > allyesconfig) failed like this:
> > > 
> > > ld: warning: discarding dynamic section .glink
> > > ld: warning: discarding dynamic section .plt
> > > ld: linkage table error against `nec7210_board_online'
> > > ld: stubs don't match calculated size
> > > ld: can not build stubs: bad value
> [skip]
> > > 
> > > Caused by commit
> > > 
> > >   8e4841a0888c ("staging: gpib: Add Frank Mori Hess FPGA PCI GPIB driver")
> > > 
> > > I have marked that driver as BROKEN for today.
> > 
> > Thanks, I'll go take your patch from next and add it to my tree for
> > this, sorry about the build issues.
> > 
> > greg k-h
> Hi,
> All declarations and uses of `nec7210_board_online' match.
> 
> Could this be a ppc linker problem ?
> -Dave

This bug report from Red Hat would indicate that there could be a problem with the ppc linker: 
Bug 1523457 - ghc-8.2.2 build linking error on rawhide ppc64le with binutils-2.29.1
https://bugzilla.redhat.com/show_bug.cgi?id=1523457

Quoting from the bug report:
  The problem appears to be an instability in the code in the PowerPC 
  linker's backend that computes the call stubs needed to access the PLT.
  As the linker moves sections around in memory one stub switches from
  containing a backwards branch to containing a forwards branch, altering
  its size and confusing the code which had previously allocated space for
  the stub.

This seems to be the same issue we are having:
 ld: stubs don't match calculated size

It is reported to be fixed in the 2.30 FSF binutils sources.

Could we rather make GPIB_FMH depend on !PPC rather than BROKEN for now ?
-Dave


