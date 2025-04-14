Return-Path: <linux-next+bounces-6224-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB569A8842B
	for <lists+linux-next@lfdr.de>; Mon, 14 Apr 2025 16:14:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB1BB1717BB
	for <lists+linux-next@lfdr.de>; Mon, 14 Apr 2025 14:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16FD02DFA59;
	Mon, 14 Apr 2025 13:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UL239mgp"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9F52DFA57;
	Mon, 14 Apr 2025 13:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744637580; cv=none; b=EygfJgp0Wq4siOsJ0zJp8fDLODus/2XF+K0igtvUKpvNtTcn89DrFacql3opIdvPyB0Oh6KrWq5dbtoX46VJ8Vs+qfjie42xDtc7XT/ja8o8Pe+beSyR/gDzYMMi/nKL66dGw3Lokw97HefaGLZ/MtwsfGZsro2euwwsm1LxoSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744637580; c=relaxed/simple;
	bh=PVh4ckW/rAu6UdSpu1FQ1HmH0IVyLanqaHyGThOzK58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IV+slTg9+PpsTd9caQRrjdkPLCcZfNRehC6YaU/2xj1i4a0GDCG61z8CZAzpF35Tl+3oNqp981l8Lb9rhAZwU6S3KA0kss8fWnw5A+ubeRBk+ct5FgZEvrKIGCT4r+r9XR30t5j5FwB1Eajnrcy940xsUWu542nhWRuKiiBhZNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UL239mgp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FF24C4CEE2;
	Mon, 14 Apr 2025 13:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744637579;
	bh=PVh4ckW/rAu6UdSpu1FQ1HmH0IVyLanqaHyGThOzK58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UL239mgpFjvycQleYGG196KUI2P5dJvBx0NNdhasKNPF730HTIuavUmYHrahmqdo+
	 uNJc3k6XJSXl8asyT6I8vxoQ7t92JLplM80KpAqC+IFou5pW1UVzQ5dsnDE6rUfsJZ
	 0sWFN8/Mc9kAx+He3erSB/PBaqYWb8dv9hIwKp6xS33y7vpcWiYlADTjUYpfvNGEQ5
	 /uPo0MtXKY/3V7NPeGpJAayKK1OtZ5h5FQWSmzxaBUwUal18bWYWTZgGnczNwS9q3Z
	 sagIgbkcL40Br086w867EhMb6MJ8DT0I0EULpiE71yQ4C9rOcuuIG8vskJkxN+42YV
	 kuTnoxeIIxZ3Q==
Date: Mon, 14 Apr 2025 21:32:55 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	chrome-platform@lists.linux.dev, Simon Que <sque@chromium.org>
Subject: Re: linux-next: Tree for Apr 11
 (drivers/platform/chrome/cros_kbd_led_backlight.c)
Message-ID: <Z_0Oh8OjiLVUSbMh@tzungbi-laptop>
References: <20250411154455.3767ebb7@canb.auug.org.au>
 <ed8adc69-c505-4108-bf63-92911b0395c7@infradead.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed8adc69-c505-4108-bf63-92911b0395c7@infradead.org>

On Fri, Apr 11, 2025 at 02:29:22PM -0700, Randy Dunlap wrote:
> On 4/10/25 10:44 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20250410:
> > 
> 
> pn x86_64:
> 
> ld: vmlinux.o: in function `keyboard_led_set_brightness_ec_pwm':
> cros_kbd_led_backlight.c:(.text+0x3554e4c): undefined reference to `cros_ec_cmd_xfer_status'
> ld: vmlinux.o: in function `keyboard_led_get_brightness_ec_pwm':
> cros_kbd_led_backlight.c:(.text+0x3554f41): undefined reference to `cros_ec_cmd_xfer_status'

Proposed a fix in https://lore.kernel.org/chrome-platform/20250414132427.204078-3-tzungbi@kernel.org/T/#u

