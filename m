Return-Path: <linux-next+bounces-4698-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 717EF9C142A
	for <lists+linux-next@lfdr.de>; Fri,  8 Nov 2024 03:37:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2998C1F243B5
	for <lists+linux-next@lfdr.de>; Fri,  8 Nov 2024 02:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 817033BBEA;
	Fri,  8 Nov 2024 02:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="oLju61dA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E3529408
	for <linux-next@vger.kernel.org>; Fri,  8 Nov 2024 02:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731033464; cv=none; b=bDQMj8as+QXybJfQDgEGX2kkZbo/3RMSteB1s1/iCVR4cgv4MfPulxOMEFyAcNgVOVG75XvQH+5v1RUiQT2AOoiCV9FX6AutoKPBIzbVMgQjwXeA1nE4QrgAjBdHe26XrENXNKmGU4pVKuarRYYw/V8QCPHI5KpI/anxN93wZA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731033464; c=relaxed/simple;
	bh=uEnmWZfKiN+uFlTrQY2HbZF5tWrOHez49q3kh8IszPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OsCA3lbIKRadItJQxhUtDRzkZDFP7Zm9qdGVz1Onw1fpzcsL/2wvHMMlNQzDfgsaow0Q03NJUW4mrwoKPVUh1+x6dPNOL8NF58dzDnuNpmlApgzRUhN2d2Wie+ZtY7qHNjqLP2NxgdisT9yloRXUSvvjKHnoN5AYX1CfzdzMvL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=oLju61dA; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20c693b68f5so17451745ad.1
        for <linux-next@vger.kernel.org>; Thu, 07 Nov 2024 18:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1731033462; x=1731638262; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GwuTyrVE+5I4I4FYLNKR6yYv0TCkdnFD8YeyKGlZckk=;
        b=oLju61dAf7woJksMA3edIhfWwFepoZnhkAlGZJ3W560oBSAq8pWq2KvCghy4CkejCI
         tmlWIsZIox+qOizn+T+dMKNIFKaU/ESOCmAaXmiRCnkhYmtNoW1FTQYXd82kQMoHanJW
         kczPMaIL9L2c5X2R7Clac49M2WL7Bl1iENcSJEerOw2ceFOFh0xe8PxkI8p4iEiTm+Kv
         BNeYYmg2QxsHgBpCEuExdJvjaUbkfxuSdSwLMx7C8alek/2xB+TwOBoomEB7mi7oWcK7
         NNolgaDdcSOoijbh2rWRpj+XsxR7XMtVspMdwr+E1M3175An6wKSNBlINQp6trkvnhRa
         MSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731033462; x=1731638262;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GwuTyrVE+5I4I4FYLNKR6yYv0TCkdnFD8YeyKGlZckk=;
        b=NfO3vBOrgWKgoEirGzChBtsDGGu/ftqUCljvmbEpAQFhrepMf+qoy9o4ooH3D8/vuW
         aShjwJIQEwWFLso32+p476xv0Q3jHkT0ySBBQGyf2WpyMW6cwIpiPJnmcYB9L3rcQWnP
         Bp/8IaL7vQu0ghkOEt22TiJBGZTGMM64LdmaYpsie5TEaxj7TuizkvWrRRbr2kg0cmlQ
         vJ1RH11RYk5ylURA0hRDWbBn4PQzP3qA8nBhYPQ1NttBiA2xsSCPPsGTpEqjA+s8QCnw
         a2rAAhBDA9nPLwU6ta7GPBuFI03idnuNVWhIVY9BLk/hya/RE/ubHzUwPT5o373ksVz3
         MRDg==
X-Forwarded-Encrypted: i=1; AJvYcCVRjoWbcqt1zRodI4VaolcfydSNBFEsIm+kPIcxttiFUI35iYZfuzxRz6kr9pStWEzN0+VI062ghNZt@vger.kernel.org
X-Gm-Message-State: AOJu0YyMNevWat9X607AR2bRH6ZdGd/fNWs1f262ezzRqsnakCsAxb0I
	bYzcKyo2P2qQFtqXqzUwxafl889/BeMfhpIn86mM3XQAXT3N3C84azKQzrf3mpg=
X-Google-Smtp-Source: AGHT+IH8ncqrcsfunj3ifretZRkdIrgX4/OntQnqoDh6lQXVP8mNX2kaJzXPcQ0u2qL58nEWGKGpVw==
X-Received: by 2002:a17:90b:2748:b0:2d8:840b:9654 with SMTP id 98e67ed59e1d1-2e9b1754affmr2018796a91.34.1731033462451;
        Thu, 07 Nov 2024 18:37:42 -0800 (PST)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e69daesm20122845ad.228.2024.11.07.18.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 18:37:41 -0800 (PST)
Date: Thu, 7 Nov 2024 18:37:39 -0800
From: Drew Fustini <drew@pdp7.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	David Miller <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Networking <netdev@vger.kernel.org>,
	Drew Fustini <dfustini@tenstorrent.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the pinctrl tree with the net-next
 tree
Message-ID: <Zy15czmqRLN4Ov4u@x1>
References: <20241107214351.59b251f1@canb.auug.org.au>
 <CACRpkdaxB1APxK_rRFEhcwBw0JZc20YN0z_881_iYVxeKs95LQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdaxB1APxK_rRFEhcwBw0JZc20YN0z_881_iYVxeKs95LQ@mail.gmail.com>

On Thu, Nov 07, 2024 at 02:59:25PM +0100, Linus Walleij wrote:
> On Thu, Nov 7, 2024 at 11:43 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Today's linux-next merge of the pinctrl tree got a conflict in:
> >
> >   MAINTAINERS
> 
> Thanks Stephen, looks trivial enough but will try to remember to mention
> this to Torvalds.
> 
> Yours,
> Linus Walleij

Thank you for handling this conflict.

Drew

