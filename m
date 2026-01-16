Return-Path: <linux-next+bounces-9692-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 257ACD386A5
	for <lists+linux-next@lfdr.de>; Fri, 16 Jan 2026 21:08:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B062730D80EF
	for <lists+linux-next@lfdr.de>; Fri, 16 Jan 2026 20:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D367D362154;
	Fri, 16 Jan 2026 20:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FM04pxTH";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="r7XXaI9i"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4804399A45
	for <linux-next@vger.kernel.org>; Fri, 16 Jan 2026 20:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768593941; cv=none; b=UXaM8pgz25jqbTQV8NeZxHkbWo6UZVS5nx+Zsa2sl4abXV300DeJNxEjr5Ht+hSqbqlx/MMOeRHPVNqQBL8fZcOWbbevPAnQTD/JfymJTg2YmpvHDremyc0QGiZTnHF7DoxqOtlhnyQCcRNx3yeJx95kPBfhZLFzbTtPUdvLSJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768593941; c=relaxed/simple;
	bh=5uPok+ZNzCrKkbXBS3bJhFs6Q6CzjbcspNfX+WjMp8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tbK8Q8xtU7fExIa16utQY2NirMe8LwV8tES2oECze8gZsfKBJipv6s7IgxMEvqjXeZY7C02jPzwrw52+neh8rfBqY+G4rvMKXM7QeNT3ZvDWJcRa+btouZ359jDuT0oi2x08U3FJaYFF8ctNmPP/RAWAB5CsKQ57BCvVPZ84gkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FM04pxTH; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=r7XXaI9i; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768593938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z4HZ8n+dKnAg/Xe5H6GtkXeY0gq+Zfy5dUSNHQWcJfs=;
	b=FM04pxTHusTSwABeszbxaFPhd8GNs7dNzkbTdQbvAGuN6YarC2RO0Pf51NUuKwueiHALWd
	5aCP7YPEDMcw/8LdEYdPtDSPNBXElPYyoLlv8cLJ5kyDld1NJfXTckd1rhyIsR1zyMQOJg
	HnCsOpPz6Ko13Ad+O19ICP6HflJ1eZg=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-316-1ucqjge3OOmjFRUiumStIg-1; Fri, 16 Jan 2026 15:05:36 -0500
X-MC-Unique: 1ucqjge3OOmjFRUiumStIg-1
X-Mimecast-MFC-AGG-ID: 1ucqjge3OOmjFRUiumStIg_1768593936
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-890586c53e0so57596376d6.2
        for <linux-next@vger.kernel.org>; Fri, 16 Jan 2026 12:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768593936; x=1769198736; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4HZ8n+dKnAg/Xe5H6GtkXeY0gq+Zfy5dUSNHQWcJfs=;
        b=r7XXaI9iMLzvozZveI9urU2bGgfo54TBaARA0Vf04jMW06/j26N7JWVcI4DNPYV8Z2
         UScMWTB0iRtK3hK+MqMMUQCzsXS+DpdsaTwEcHhNcY5JeLUnpyda8cG4/ZxYJlJJz1ap
         4CNSk/J5Di6TElT6UNhWsQukG+U9XUMnf0mocXhcr0ophs/hw60+l+RRc1HyjI/IWruf
         tlvJGcgFfG6LUb707J5GAlE8guQBZIy7ZbBWRawsz8WMFJbdXKcOPYL25Bwv0HKPEjdV
         PrPdGIzkL+7XZ9KiW9AmuvMxH6L31iZQ06kzweZbL3XVDj7LZkVDCQcnP6H0THfDjKMK
         /6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768593936; x=1769198736;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z4HZ8n+dKnAg/Xe5H6GtkXeY0gq+Zfy5dUSNHQWcJfs=;
        b=pqN5Gw6xHszVlL48qPyqY/TqlLgR7rbqVhgEhRth+5FgOvBLVxIG7mF3jp4Bkt+d2i
         uZxJuWdnqLW64rfWFO6Fg1DOrVuCKDeaG7xRXu5BINtuqJ0LUEoRIovw/h92EIjtMSMZ
         +G7FA36p+v9iybrLAjM3Lf/beNgj/DkB7z7HVVnJAieMdVY6uxEqDvKHUUvBHywvNPVL
         N4KqfBpayscAjCtDwWili6/rtVmi+p3OdYf9QSl5Ob98sKD5fx2XWE1p9qZg9c3f89U6
         iaxSP0TSH/oS0EG/f7yzOYoFjP/APLRiQ8w9L3NGylGXF3FfxJIlZXPrtY8qdxG+GPpu
         FABQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7pIw48pmzNPZY4k2AbJfQ62//mOoHlfcjBNuzf7iQksSBnpxffC5VH9/rzUE0L+tDB+vJp90bnLFH@vger.kernel.org
X-Gm-Message-State: AOJu0YwfiiNewVqqAN8k2WWE3vpIvAOwUIeBfTfl1XFolOj5kjbpKGak
	NAvRkeUV7C3DKBlwvRxsJKjoHghqbqHnvn0YkU6jv37BZyRfB04KRct+4UlVJI4IFjLxF8wlTNt
	ik6vz2FuHZ+FHBnaz8JjJ14mNPEiOXsszIfYgB5/dxsjA9VCPwJIFxciocLWV3j4=
X-Gm-Gg: AY/fxX5TEMvBlYn8cwYF955NOkQd2lWlgCGM16hF7nrbeM6P8v3TNj0cfTJ7WBwimPI
	cAq4i6PHZs7JOe51aURYKQKbwC9GcAjI05UjNYhOh2lavS+XfQ5/lOVni5MJIxK9GrpdeY4Fbou
	guldGvgbIxq1fNDAcALnaXlvleEUlr8wNQx/fBX9ry3f09dHnYH5Tuf5JH3naYs6X9vEW+GuRit
	3E8EM2M+DVMJS+y6CblwHHDMFGndavTMfFcM8d3HzSidgvi0Q/e0hxfA11NP9NlArjfUIaZKBRt
	pBIpbwDtEpeWCLHOM0yTk0vbARI2P3zf8/2W1H6VzJDEjxvYrMMKoTt6KZ1mV5L1wVgrLS7vMo1
	Q2qflkGY=
X-Received: by 2002:a05:6214:2247:b0:87c:28cc:9e69 with SMTP id 6a1803df08f44-8942dd9e313mr54891546d6.55.1768593936168;
        Fri, 16 Jan 2026 12:05:36 -0800 (PST)
X-Received: by 2002:a05:6214:2247:b0:87c:28cc:9e69 with SMTP id 6a1803df08f44-8942dd9e313mr54891096d6.55.1768593935559;
        Fri, 16 Jan 2026 12:05:35 -0800 (PST)
Received: from redhat.com ([2600:382:8119:a327:859:fe0e:d2dc:5a6c])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6cd63esm29911406d6.49.2026.01.16.12.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 12:05:34 -0800 (PST)
Date: Fri, 16 Jan 2026 15:05:32 -0500
From: Brian Masney <bmasney@redhat.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andy Gross <agross@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the qcom tree
Message-ID: <aWqaDCvjs-mR12_c@redhat.com>
References: <20260113080606.07743e2b@canb.auug.org.au>
 <aWV9Az3SuQgvSBQ0@redhat.com>
 <olnhf2ritwl4eh4plujlcthohsortsspagdioaqcugvdlgquad@l6pljrt4k4ws>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <olnhf2ritwl4eh4plujlcthohsortsspagdioaqcugvdlgquad@l6pljrt4k4ws>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Fri, Jan 16, 2026 at 01:42:56PM -0600, Bjorn Andersson wrote:
> On Mon, Jan 12, 2026 at 06:00:19PM -0500, Brian Masney wrote:
> > + Bjorn and Konrad,
> > 
> > On Tue, Jan 13, 2026 at 08:06:06AM +1100, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > In commit
> > > 
> > >   35a48f41b63f ("clk: qcom: regmap-divider: convert from divider_ro_round_rate() to divider_ro_determine_rate()")
> > > 
> > > Fixes tag
> > > 
> > >   Fixes: 859a7e020b23 ("clk: qcom: regmap-divider: convert from divider_round_rate() to divider_determine_rate()")
> > > 
> > > has these problem(s):
> > > 
> > >   - Target SHA1 does not exist
> > > 
> > > Also, the subject in the fixes tag is the same as the fixing commit,
> > > so I have not idea which commit was intended.
> > 
> > I missed up my Fixes tag on this commit that was applied to the qcom clk
> > tree:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?h=clk-for-6.20&id=35a48f41b63f67c490f3a2a89b042536be67cf0f
> > 
> > The Fixes tag should be:
> > 
> > Fixes: b6f90511c165 ("clk: qcom: regmap-divider: convert from round_rate() to determine_rate()")
> > 
> > The SHA is correct. I just have the wrong commit description.
> > 
> 
> I believe you're saying that both commits should have:
> 
> Fixes: b6f90511c165 ("clk: qcom: regmap-divider: convert from round_rate() to determine_rate()")
> 
> Can you confirm?

Yes, that is correct.

> It's the top two commits of the branch, so if you can confirm my
> understanding I'll just fix up HEAD^.

Thank you, Bjorn!

Brian


