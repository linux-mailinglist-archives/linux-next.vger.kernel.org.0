Return-Path: <linux-next+bounces-7941-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8D0B25990
	for <lists+linux-next@lfdr.de>; Thu, 14 Aug 2025 04:42:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F3481C85313
	for <lists+linux-next@lfdr.de>; Thu, 14 Aug 2025 02:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1606B21256F;
	Thu, 14 Aug 2025 02:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="pwN6kVWH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4ED215746F
	for <linux-next@vger.kernel.org>; Thu, 14 Aug 2025 02:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755139324; cv=none; b=dRIX9e2DURQPJ6MVJrDwGLvAkNCbRZMVxFa5U2Ltq7n+OPwFMudOusbIFpMiNsbeVDBoZBYRvif6Rmdc0+tYxANj/OL42nSBLISTJNifkRI5rQ3xGqQY8HlxhWyz5ug3shyig55VI/UikNAdbToBOmHbRCKTzX78JKXS84l/o6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755139324; c=relaxed/simple;
	bh=5Az+Af3n683KZXZJI20rTIjpZlv6RgGbYo2hi8ndzkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M3kHb6b/1GuNwQtF/ff2R/drjCB/VWAxKUArmYFg/j3eDjo1X9kx3/R5de+A2+t2IHsOw6wt262vKqm5+R51Rqwlip9HlO0+8t48Bu0hnIcTP4mVF7soBanLyd1XMQQs/ABT4tIdC38vr1anI1dMn3SksVErdTINHOr+jmTyRVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=pwN6kVWH; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-61bd4e13d90so300015eaf.1
        for <linux-next@vger.kernel.org>; Wed, 13 Aug 2025 19:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1755139321; x=1755744121; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJNUvNqMaWEA4NfLjVG0wZfCDDqvwD1owu885aCL3Q4=;
        b=pwN6kVWHNR+gs6sz1zfta4Rb+Yq3lf9G5/XF5bOodJfx0pQaoOHBzIR4dwqgDbbn34
         +FpPVpvcGa4UcEJhY8XfG71/VCrImcB0qYwLGVGQFokwcDwLkh8quPOC8VwntSe1L7aQ
         Sq/DvxvKrXcjGPTR8MBtTCREiWnW/ICvDbTdpt8ygzaWgjlMw4C2rv9tGT+f3lWQgBP/
         fwtdTl4eYXgs42/XWXbbzDkpfvgv4Z7KItR8ZSqOm6KA28gGEY0tuIPq7z4hDjVYvHn6
         Jf2VmJkZVaVOqlqZE+fg175hFKQ4raBCqg3ULE6j9gBU+8/2Xh0VfOevX4xmwakRyuD0
         JfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755139321; x=1755744121;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PJNUvNqMaWEA4NfLjVG0wZfCDDqvwD1owu885aCL3Q4=;
        b=L4egbQJOdHz6OS5SGr1jEM4yIAoJ3YVLO+eaJ66qN7afQtsRoiHq1P1PqS+PomwQ6L
         85gxwhT2WyxbGZgnEy2aLNZMF5oYu+o5HC8/3r/bqzqPDU9yuB8rTKbtcm833P24I5Bb
         QUlr2sOhzAUcqr/XHf+sQnfNyfy0xGYPXe4GRABeEIw302L96MRKvWN4/op47JyyvhZV
         EpcjNjeXwPeb6wOwND4hYZPZtEW9//czmI54QAMgRiyWEtUCtKQ7ooUySpEfeZ+pphAe
         QoYSByFcQpm+HhR+xVO9MvD/OAU7UXY+gT+beR1FAhdRlPCUlWMiMwtMYhyhuPITQogo
         CSwg==
X-Forwarded-Encrypted: i=1; AJvYcCWqta3Nj3ziG/wj8x+DYpduFkheBy+oKWLw8Oz6dRaiwYSxVNkkp5VBAByWiCvMdocK6UiE/nE/na/4@vger.kernel.org
X-Gm-Message-State: AOJu0YzKV3p+7WJ9d2R4x2unmMYBaAhWpiiIKk+3R6436kCupyLwudiQ
	m+BN4CNXmle8208FInDtZcVe+0bibt1AYjeQjtd+bjj1IzAKxoSgU4XxnhxZFQsOlGU=
X-Gm-Gg: ASbGnctkVRnI9ED7XlVw53mIMrHAdJqfWtN3pqWv8IBTS9nrTzK0j7xU+Bz5g93RBo2
	zUf52thgJ6hDwufTeOLDTpncLTp5CQyXjlDTxV2HFLhoiy5kn/wCfX8xWjRc+FyMQDZc9tw17qx
	QubaXyvJOXTs2H46j7C9YzYHsQFndwHQTcaX29L4LAC53FmnXWpER7D7oy/WOmXqxSMp4sHX7Z1
	rwBXxefa6ymGtFAHVsgD5qlFdLLB9vLG+c4ECDu7X76im/9q8mOBlCxu43YMFqh989JemsiABt7
	ulGLyWwmgzK7offWrrxoy4Z0JO0KkPFQRSLpvwfnME5sWLirGTJuDGwaQtrfO0csAnmg08y+Z7Y
	O5BU3A+b77+HkZTjTGfkIxBrzk5btnNUDG0Y=
X-Google-Smtp-Source: AGHT+IE/Whgr0VPOqXq34YRNuyEHshloSAlvqInb6X7aJcqtcPv+fjB8h72KLEAmiG1lXgEK1jMYVg==
X-Received: by 2002:a05:6871:7b06:b0:308:fc2b:b7d with SMTP id 586e51a60fabf-30cd139a2ffmr981337fac.46.1755139321636;
        Wed, 13 Aug 2025 19:42:01 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:b599:8872:e83:bedd])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-30ccfe6bcd5sm360892fac.14.2025.08.13.19.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 19:42:01 -0700 (PDT)
Date: Wed, 13 Aug 2025 21:41:55 -0500
From: Corey Minyard <corey@minyard.net>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rob Herring <robh@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the ipmi tree
Message-ID: <aJ1M883eMiVCtoaO@mail.minyard.net>
Reply-To: corey@minyard.net
References: <20250814114214.609818aa@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814114214.609818aa@canb.auug.org.au>

On Thu, Aug 14, 2025 at 11:42:14AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the devicetree tree as a different commit
> (but the same patch):

I think by normal rules this belongs in my tree.  I'm not sure how it
got into the devicetree tree without my ack.  Or maybe the rules around
device tree are different.

I'm fine with it either place, though.

-corey

> 
>   84e7845761c7 ("dt-bindings: ipmi: aspeed,ast2400-kcs-bmc: Add missing "clocks" property")
> 
> This is commit
> 
>   a2f5472f1cbe ("dt-bindings: ipmi: aspeed,ast2400-kcs-bmc: Add missing "clocks" property")
> 
> in the devicetree tree.
> 
> -- 
> Cheers,
> Stephen Rothwell



