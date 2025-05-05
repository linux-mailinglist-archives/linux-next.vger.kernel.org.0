Return-Path: <linux-next+bounces-6524-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF4AAA92C4
	for <lists+linux-next@lfdr.de>; Mon,  5 May 2025 14:13:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 809CB1898F1F
	for <lists+linux-next@lfdr.de>; Mon,  5 May 2025 12:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD13B206F2A;
	Mon,  5 May 2025 12:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="GpW0ZYwR"
X-Original-To: linux-next@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2564C1F948;
	Mon,  5 May 2025 12:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746447196; cv=none; b=sCrL2aTRUvs2Icg2dqSnPJd/2Hi8hJgf/0qhXgkAcjExdhbVAqbRGqOQnCTshGgjdfrzt8RSeFOvuCVdzlLfB+2NhKIArC5HadO2BoRi7HlfSYSy5bWr1EAfaLNYcHMGNUrQTwhoB3co1tXjVokMQfqj9Pfp/7/tSPXnL3mvxQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746447196; c=relaxed/simple;
	bh=1dkrlTXgjhQgccWw5BM9bvzlE2Tz5Y2CNmJBc+Cvnpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L6AtXbo6/JcUN2Oip4Aci+G+o2/Tqb86ZdMp6pvZRtxvv+0nBUhvC3rcuLzbEX2sUXasjFenmlA1YHEU62UgF7txuq2pB7rnhsHoTXk84jBQquW+KBz/pC60KXIY6+yootrmtw/6jTfjJqHPDbS33S8NBtKrqJ9j5X3M25E3/h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=GpW0ZYwR; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=HcxYbeznzeLgnR8k4L5Jr02yDg2E2ff4vWWq6+E0/L4=; b=GpW0ZYwRSgxpvl8Sqe8D7WWWPG
	KmeChwSlY9XSNIHkaR7YUmqCNjdyRICWA+et0enxIgFa3Qvz6PvanH9C6cxXOZN3uN9TvP3EBJghv
	RBFfMBev2W59Vh86tnGXTVvga/C+2o65PBWMOp6nTtNPl4JUnbA9pyn4d4GEq/f7y6ZILeDDFAP9B
	QojOKKA8NUVIPDZk/KQmhTwyCzXcuABqCkovc/nbEmiJJbwgmu0CTcxfv1YadlZlGWbVxiWQVPytQ
	C1PKhZNFKvpfVkUJpP96kcH97P1pNGf4Gk3t9HGA2C6KnGLHCtFXBryHUrcP0+lGX9xFbYNVn7APf
	FsaOpKYQ==;
Received: from 179-125-70-174-dinamico.pombonet.net.br ([179.125.70.174] helo=quatroqueijos)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uBudm-003ieg-Rs; Mon, 05 May 2025 14:12:56 +0200
Date: Mon, 5 May 2025 09:12:50 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
	Andrew Morton <akpm@linux-foundation.org>, kernel-dev@igalia.com,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] char: misc: make miscdevice unit test built-in only
Message-ID: <aBirQvBkvKhnTLYR@quatroqueijos>
References: <20250430-misc-test-fixup-v1-1-6f39ed6c733d@igalia.com>
 <CAMuHMdUk4UqmZV9zyzRz3S6n6+6vRQOcFymR_5J1A=JxAXUsSw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUk4UqmZV9zyzRz3S6n6+6vRQOcFymR_5J1A=JxAXUsSw@mail.gmail.com>

On Mon, May 05, 2025 at 09:21:15AM +0200, Geert Uytterhoeven wrote:
> Hi Thadeu,
> 
> On Wed, 30 Apr 2025 at 18:53, Thadeu Lima de Souza Cascardo
> <cascardo@igalia.com> wrote:
> > Since it uses __init symbols, it cannot be a module. Builds with
> > CONFIG_TEST_MISC_MINOR=m will fail with:
> >
> > ERROR: modpost: "init_mknod" [drivers/misc/misc_minor_kunit.ko] undefined!
> > ERROR: modpost: "init_unlink" [drivers/misc/misc_minor_kunit.ko] undefined!
> >
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Closes: https://lore.kernel.org/linux-next/20250429155404.2b6fe5b1@canb.auug.org.au/
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202504160338.BjUL3Owb-lkp@intel.com/
> > Fixes: 45f0de4f8dc3 ("char: misc: add test cases")
> > Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> 
> Thanks for your patch, which is now commit 20acf4dd46e4c090 ("char:
> misc: make miscdevice unit test built-in only") in char-misc-next.
> 
> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
> > @@ -2512,7 +2512,7 @@ config TEST_IDA
> >         tristate "Perform selftest on IDA functions"
> >
> >  config TEST_MISC_MINOR
> > -       tristate "miscdevice KUnit test" if !KUNIT_ALL_TESTS
> > +       bool "miscdevice KUnit test" if !KUNIT_ALL_TESTS
> >         depends on KUNIT
> >         default KUNIT_ALL_TESTS
> 
> This means "default y" if KUNIT_ALL_TESTS=m, which is IMHO not
> what we want.
> 

The precedent for other kunit config options that are bool is that they use
"default KUNIT_ALL_TESTS".

It makes sense that if you choose to build all tests, you would not skip
the ones that cannot be built as a module.

Thanks.
Cascardo.

> Perhaps
> 
>     default KUNIT_ALL_TESTS=y
> 
> ?
> 
> >         help
> 
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

