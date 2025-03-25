Return-Path: <linux-next+bounces-5996-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A09D8A6ED48
	for <lists+linux-next@lfdr.de>; Tue, 25 Mar 2025 11:02:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1434170319
	for <lists+linux-next@lfdr.de>; Tue, 25 Mar 2025 10:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 425CA19DF41;
	Tue, 25 Mar 2025 10:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Q6pRMQhu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6E5254857
	for <linux-next@vger.kernel.org>; Tue, 25 Mar 2025 10:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742896921; cv=none; b=Q3fwJblXs7ShB1ipeOchLclhkl94I8PCTuRjWNDgyBqnfRL5Aq9JxKehHNW82pyi6Z9E8EjMIP7mpyqthHMiuYTUdx0qoAiqPcUG5WNKoFpDM+8/qV8XmHhsVQATugIp1tb/FRzbL7KKHDAxNoAKY1ZfxLUhr9MKtBRlzE6Wa6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742896921; c=relaxed/simple;
	bh=u1Az67vlS+7L2hZ01L/haLmuxE5Ik84O0pup0jtGQxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z6f+RFyuvWXjhcQQmoTx+oQcmBWOH+Bhi6M6hz6pxZuqbwsedmrHTlnOUI9Yjwy1qqyltNQtQRAFOc3p8GrbC4EAz7IO8U/sJPtDlc1qu2cRhmOVem40GPsS/2j523vtiOLC9YgFKSJ4T7BgyycF2dAweftes9xBy2sy+LDxSU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Q6pRMQhu; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-390f5f48eafso2952416f8f.0
        for <linux-next@vger.kernel.org>; Tue, 25 Mar 2025 03:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742896917; x=1743501717; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nMblP3h4cEOnPAdB6DxVK+neSqUEhMjzJVpUeyv9ozY=;
        b=Q6pRMQhuY5w1lgGP3RAnEhj2bUvSQvVqSf0VwOB5N4X8fZeEQv2FzOXTncTnjzPlOD
         +YwtLXGovUiUb2M5rQVIMmxiMIB4oR7zAv0bsNh8WNZs3qJ9Nk7AyB0V45Kpdow/TTRK
         G4NMaqLH8ayOXxNYvFkYXmKKJ5iYSt8WGfGyj5kfkT50J4eCo04uw5pIsxErlhCEHJd6
         oqIwYO5DPMagCq+sIXM8ZLcgX4+7tkT/+98SDputthj0Rpp87aTs1J9mYZoy4kXx37r5
         oXny+7Pjlv0Uk6UXRoXrLdkKyRh5zF8UxN1sfd/TLZFtIol18bDK29eE2UVHvhH21YnJ
         qWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742896917; x=1743501717;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMblP3h4cEOnPAdB6DxVK+neSqUEhMjzJVpUeyv9ozY=;
        b=OeG6fzioCj3S5b2ploT/kgwXD6F/4AyXgDcM5LzZr7t6Ey2C7l7TnsRkbZsTtwAL/f
         P95V3+70kQ4ckOLUWg/US52EuVuT9XfIVqG+zYLc03+HWwTI4u+s8G9I9fDRwnh9h7ic
         MkdldENjZjYEuV9Veapr6yKHUtMNBMOch1ZwMyVYi+BqCl+/wOMbx23aKilpEXg/uDix
         FdZeDub6S+f6rn2xph/y++jXjQOEMyCl9Ww/biYADd/5RoyUeTfqfKSPyJbj9qg7w8Te
         dA94BXchdChGR7HYKTFKYZFeVU7R0qRC9LFp6Qi1ZCD2JyWidYAyWTNon5+GPNAN0Zfv
         2+yQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJAEAFns67eHJgKcNPbKaNklwOcWgRajOpwK+SjOGeUjKkVl4HpmlljVSB7U+5frt5Ia7AdYwsvwZ+@vger.kernel.org
X-Gm-Message-State: AOJu0Yzonj9Fgy8ZRvWMqaUVQskvIUpl0zJlxST5I3PYlLHNJBQweNla
	dfnDrvVsIi4AbQypu7LlrNDzGATFMoVXoNC4P3Z1JRuXe3cMbkTakh1D9H1kSsA=
X-Gm-Gg: ASbGncubTNVmWuxWCmyjjeG5EbJdXZP0OrlypfVLWL6qJ0e84XAVpkIrvPWZe6vurTb
	g8s0IrVKU5A9AuJzioGPzo7SOjCU0f2shWtelKO20ASRBiFwyNM1tgqTZzx6hNM0vbLKKIho5nV
	d1A+L5wd3l5Au1kiFKqLn8JzVZYimqtlauYaOnGlkUNE/HhpgZ2NRgUvYrMiiOTvdXfAk5ejyv3
	GYsRj+T8eZvGe0T4o9Rndowaag/nXM2tM7hymrOoPoRvVWjm76noLm5EMjMujZvsq8dta0rE7AI
	FecY+oRsNHp9UZhptziZTf/pc1O6OuoxqZaFnLl81462
X-Google-Smtp-Source: AGHT+IENT/IPKbT6Qsm0wWCiMdCWIBWfOpP5sfGyY1vKH3mW6SLMa0nz4G3RYr9l3qhX6nvzCnZKNA==
X-Received: by 2002:a5d:6d08:0:b0:390:e889:d1cf with SMTP id ffacd0b85a97d-3997f92da8fmr12375291f8f.37.1742896913536;
        Tue, 25 Mar 2025 03:01:53 -0700 (PDT)
Received: from pathway.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d440ed793sm200277465e9.39.2025.03.25.03.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 03:01:53 -0700 (PDT)
Date: Tue, 25 Mar 2025 11:01:51 +0100
From: Petr Mladek <pmladek@suse.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
	Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	live-patching@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/10] samples/livepatch: add module descriptions
Message-ID: <Z-J--iv8LzgArWAX@pathway.suse.cz>
References: <20250324173242.1501003-1-arnd@kernel.org>
 <20250324173242.1501003-3-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324173242.1501003-3-arnd@kernel.org>

On Mon 2025-03-24 18:32:28, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Every module should have a description, so add one for each of these modules.
> 
> --- a/samples/livepatch/livepatch-callbacks-busymod.c
> +++ b/samples/livepatch/livepatch-callbacks-busymod.c
> @@ -56,4 +56,5 @@ static void livepatch_callbacks_mod_exit(void)
>  
>  module_init(livepatch_callbacks_mod_init);
>  module_exit(livepatch_callbacks_mod_exit);
> +MODULE_DESCRIPTION("Live patching demo for (un)patching callbacks");

This is another support module similar to livepatch-callbacks-mod.c.
I would use the same description, here:

MODULE_DESCRIPTION("Live patching demo for (un)patching callbacks, support module");

>  MODULE_LICENSE("GPL");
> diff --git a/samples/livepatch/livepatch-callbacks-demo.c b/samples/livepatch/livepatch-callbacks-demo.c
> index 11c3f4357812..9e69d9caed25 100644
> --- a/samples/livepatch/livepatch-callbacks-demo.c
> +++ b/samples/livepatch/livepatch-callbacks-demo.c
> @@ -192,5 +192,6 @@ static void livepatch_callbacks_demo_exit(void)
>  
>  module_init(livepatch_callbacks_demo_init);
>  module_exit(livepatch_callbacks_demo_exit);
> +MODULE_DESCRIPTION("Live patching demo for (un)patching callbacks");
>  MODULE_LICENSE("GPL");
>  MODULE_INFO(livepatch, "Y");
> diff --git a/samples/livepatch/livepatch-callbacks-mod.c b/samples/livepatch/livepatch-callbacks-mod.c
> index 2a074f422a51..d1851b471ad9 100644
> --- a/samples/livepatch/livepatch-callbacks-mod.c
> +++ b/samples/livepatch/livepatch-callbacks-mod.c
> @@ -38,4 +38,5 @@ static void livepatch_callbacks_mod_exit(void)
>  
>  module_init(livepatch_callbacks_mod_init);
>  module_exit(livepatch_callbacks_mod_exit);
> +MODULE_DESCRIPTION("Live patching demo for (un)patching callbacks, support module");
>  MODULE_LICENSE("GPL");

The rest looks good. With the above change:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Thanks a lot for fixing this.

Arnd, should I push this via the livepatch tree or would you prefer to push
the entire patchset together? Both ways work for me.

Best Regards,
Petr

