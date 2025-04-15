Return-Path: <linux-next+bounces-6240-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 303C7A891E5
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 04:35:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8939A1897836
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 02:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B70EF1F5434;
	Tue, 15 Apr 2025 02:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ia0k91AA"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9016018FC92;
	Tue, 15 Apr 2025 02:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744684505; cv=none; b=Zrue7qL7mKjcERczrnFAc5J8zwOTSYPZmzpkBCuDi62M5+re3Axl80PtyPNnUXCedX8K0vzKOSrwkaRiChAE6D+WK4dxijv4mXEBVefx2rxb2tnjBypoEEB498MJ5MPGNvXG1BEW7BsCfs1WEn96Nvnj/LNjUAPRE/mIG2U8qjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744684505; c=relaxed/simple;
	bh=aRew/0U2yqYLT9fBZlrbtfHc121e9G8IpNxW5znCWR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tGfEH1jPUikXDtuw0sJnrFlUDaclnShTSXurHWAs/O9/2yC23OYOcKkXK6ebsdmjCcn8FH+GP/QIPlR5OdAvWWKxYLyNe2tgYq1HzT5iwb3UZolIl1/O8UlL7AZNibMN9+Qbgq1bTER/a4nt0CpHGyjynuC2H2nE7jOCKW0OvSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ia0k91AA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0761C4CEEA;
	Tue, 15 Apr 2025 02:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744684505;
	bh=aRew/0U2yqYLT9fBZlrbtfHc121e9G8IpNxW5znCWR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ia0k91AAKCchq4y4jGfPhPLJVjL3jKtBFNMu+Rpu2Dsuko3K7Wc7iH+AXNgSczjL5
	 qqzP9FZjXpNYBuOrcf0V2kreVUhoKrmmW4PhOsC3z/1hp9ClqfyAkP7taBfjZaET2E
	 lerGx3js8l4VVQg8D5Sb9HGgW0g6VK0xBCSufenTW91C5S+XseTXu0GkEjPt280FNG
	 ICIxFDsgGzXg+/pPrv+BafeWSjzN/SWYbHkzH/qWUe9n7wSA5LBhkY6qY1jgeJQFl5
	 7EfdzGK9HYKr/1t7lctGduVtt2IeT+34wqKvHOeE2Ee3h4gJRXsUDP+K5hZgyH3SZv
	 DQRFHXm2iYG6g==
Date: Tue, 15 Apr 2025 02:35:01 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: bleung@chromium.org, sfr@canb.auug.org.au,
	chrome-platform@lists.linux.dev, linux-next@vger.kernel.org,
	srosek@chromium.org
Subject: Re: [PATCH 2/2] platform/chrome: cros_kbd_led_backlight: Fix build
 dependencies
Message-ID: <Z_3F1ammGKVnWGGc@google.com>
References: <20250414132427.204078-1-tzungbi@kernel.org>
 <20250414132427.204078-3-tzungbi@kernel.org>
 <50641692-3f78-47ef-aceb-042b340f0559@infradead.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50641692-3f78-47ef-aceb-042b340f0559@infradead.org>

On Mon, Apr 14, 2025 at 03:11:29PM -0700, Randy Dunlap wrote:
> On 4/14/25 6:24 AM, Tzung-Bi Shih wrote:
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Closes: https://lore.kernel.org/chrome-platform/ed8adc69-c505-4108-bf63-92911b0395c7@infradead.org/T/#u
> > Fixes: ccf395bde6ae ("platform/chrome: cros_ec_proto: Allow to build as module")
> > Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> 
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>

Just realized I copied wrong email address for the reporter.  Will fix that
when applying the patch.

Thank you for your reporting and testing.

