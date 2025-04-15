Return-Path: <linux-next+bounces-6241-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8A1A891F3
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 04:45:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F089B178A81
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 02:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8134F2DFA29;
	Tue, 15 Apr 2025 02:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cGgQ0ZE5"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564DA2DFA26;
	Tue, 15 Apr 2025 02:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744685149; cv=none; b=Ggr+rIS4X3YqlPIZfUW92KYnbmHM+Olde98D5pBD1xht/OLt1KojFaj5Mdr5xN478CEK9mgCkvR+TDZCsvXPVJJYMsA62dvcyODeta5V5z68d/guTzj4XaK091IcGKzGzRRQdAuw9FJRzkcxe0iv3YM0gKDJ16/M2/s/xvTZEr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744685149; c=relaxed/simple;
	bh=68k+qc+ufXqb20CqNN3hfOgp/QguA8AweAHP94umCyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MPxY+emjlVP6WxWB5TXYrvOQZH9ux8C+13RKTLa1ugus2IrCGmDsj0PtzRrmOx+Cjyitfl6pse0bfTl5NPA/Zuy852QSipte1Azf1ZbD15D0wPvXnuxTRbJxAhffq3N+/D0XDGDOMFmgdF0GIRfafG4tvwAvuXThdCt9+4LWjjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cGgQ0ZE5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDBBEC4CEE2;
	Tue, 15 Apr 2025 02:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744685148;
	bh=68k+qc+ufXqb20CqNN3hfOgp/QguA8AweAHP94umCyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cGgQ0ZE5vOtdpnKqNyyWikmZMkddzER2mTDaubuSESd1/2QAzwwzPDHFbAJeh6Kkx
	 CGVzz+XtyCH6v3s6m+c0NFxVx74Ehg3JGbOB+oEATs3knb2hNInrinvwfH2X54X1jx
	 pNfZsA3iokFxqKkITUKQsTHBi46U+UE1p1b7CmDog7tA6dcf9sgy9wV9dsg4XnR4Q3
	 03W8oBJnlHT96uCagmW0bh+vQ8xyxbWALrn71ZiyBXSxSD9euBGdRY9xpGadwYjtbM
	 jYXhTfejV7MiefUs063aTUaYF8m/nuJbE7cY/xD4+vfePj4isHHmjm3kz7elMou9vd
	 ZXqgboGhpG7zA==
Date: Tue, 15 Apr 2025 02:45:45 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org, sfr@canb.auug.org.au
Cc: chrome-platform@lists.linux.dev, linux-next@vger.kernel.org,
	srosek@chromium.org, rdunlap@infradead.org
Subject: Re: [PATCH 0/2] platform/chrome: cros_kbd_led_backlight: Fix
 dependencies
Message-ID: <Z_3IWd1fng3IV9bZ@google.com>
References: <20250414132427.204078-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414132427.204078-1-tzungbi@kernel.org>

On Mon, Apr 14, 2025 at 09:24:25PM +0800, Tzung-Bi Shih wrote:
> The first patch removes a redundant dependency.
> 
> The second patch fixes the build errors discovered in [1].
> 
> [1]: https://lore.kernel.org/chrome-platform/ed8adc69-c505-4108-bf63-92911b0395c7@infradead.org/T/#u
> 
> Tzung-Bi Shih (2):
>   platform/chrome: cros_kbd_led_backlight: Remove CROS_EC dependency
>   platform/chrome: cros_kbd_led_backlight: Fix build dependencies
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/2] platform/chrome: cros_kbd_led_backlight: Remove CROS_EC dependency
      commit: 9aea0edcc3e92f5c40184b96d004b4af5a8d264f
[2/2] platform/chrome: cros_kbd_led_backlight: Fix build dependencies
      commit: 31d3bd592df5bf2912b8d97b0652ac3f0cd335cf

Thanks!

