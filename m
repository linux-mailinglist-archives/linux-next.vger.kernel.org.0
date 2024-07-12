Return-Path: <linux-next+bounces-2980-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDAE92FEBB
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 18:44:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 302631F21BCF
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 16:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D56D5176246;
	Fri, 12 Jul 2024 16:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QNAibmIO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4C91DFD2;
	Fri, 12 Jul 2024 16:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720802678; cv=none; b=ZctHZ4FvnRzQyyk4ID5BHCSG1rBO/r/o9TcsHNOSFKc38pNY+DF4X2X8jzlxDcdoDvvv5yIUoz8fka0NnmDiiD7Bp/wsfEpwylG97YjWHaMpefd59aaH/QVQ23NDcKHbZKvrLti8+vbZ2OBVTgQbSZWj3KyTRAtwx3m7vqzXC+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720802678; c=relaxed/simple;
	bh=YxRdb5IHqO/LJY/dxEeMHOtFew6h7HXipnunZJonl2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ctZv8jSRR7b4T+TakTUhD4dNodoKrpt1DKT0o++im5NHmZv8M7SdP6PGx6duPyyszJjb2OiIBu121OE7f/OkZQnoyUblUot0bFXsitxw3PHtTtmWWtQAyR5+VcWNEhg4Wor3gNLQj0ADWCa86k2RlFyA52433SkDu9EWN0C9n6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QNAibmIO; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1fafc9e07f8so16578645ad.0;
        Fri, 12 Jul 2024 09:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720802676; x=1721407476; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mf3+N0YSmeZeihxo/NnmDHWXw8mFHbf47GlGRoikzhs=;
        b=QNAibmIO0jWp7ZZBGq/mUSS8xVnajGYYCf0ODd/g1H6UveIoCkaEw3rzMOZgqT/itf
         GSBHhswo/273QTvE7WpGS7F5vR3cOroxZ3tFHJ6Qm7BVfQD9EHkUKRwr0BOVORsAIBSA
         zcXdukrfe3MMFfNWsMA2/tOC78GwhrlJXxgHZhOmPZc+XZSwmPviJP1Dfh/OF90l6/aP
         IXxZlS0OIzUf6nO/mrnOmuqVy8l6QIZYWJjcNjzBpIA6UFLpVcdWjNytwvhZgCnJ/d82
         g4SKzR9LGhrujJ9DntXKrdzSYUReR/gAC13CR7Phvrlc09JmaiVRRnwvTh+fGwAYCkMj
         xFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720802676; x=1721407476;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mf3+N0YSmeZeihxo/NnmDHWXw8mFHbf47GlGRoikzhs=;
        b=jqhkYOABui8ocRP43Ea33iR3hAxaHjbSQTOAcenRd4BiUrvYylsqGHuTgAXMIn+EQl
         g166HGvi51udc6UWZDacZ0h4dfUdJ6RqEuqSwNRV244RN0sDEQczAomxDOAs+djyW5c7
         uXbffQdFa8zBcixr7SyhmWVfVBPxp5q2mXSEq+t5Lnq6D+DPmioHxRVf5zgnMX4+59Q0
         X4yvzzBUsZFieSYHtNnHY7klZWKd3IpGWY8vmdpvSGPLwd+L9CmVEtGt6L9C7zs3s3LZ
         SVrAiOwlESAl3v4L1kcEZxaEKBCDmVj6+Xfh0L9S9BXeGTlYP0ibnHlUcEaVBYy1Rr4q
         Gt0A==
X-Forwarded-Encrypted: i=1; AJvYcCX4OY2VfujsaMry+0yRklRVY5OAPPQ3tTbHrRnSDgdBWSKUcZCUapj4gyXFHlFp3ordAzKYM0dHKQPCasijPsaKFapyjXbrEPeGmuYRG1K+jpo3ZBFYb5nXtPVBZi/hu1S95I0ysx00LA==
X-Gm-Message-State: AOJu0YxRGgbf6uyiIr0Y2Oqdw8ldFAvSfMiuL6AlG9OG8d3KFpqKm2LE
	TUhRN7ETZsI2O94WuhiCCnI51e/jPNaEeyylxi6fJZs77qKcxoRz
X-Google-Smtp-Source: AGHT+IEd2hcToL9T2KKyG1KdlYVWLDe2KMkYzK/sMrcZoiXMDle0FAqSC9YcLXok9xeOaQ7fLFcVQQ==
X-Received: by 2002:a17:903:2343:b0:1fb:5c54:36c8 with SMTP id d9443c01a7336-1fbb6ed576cmr106880785ad.50.1720802676551;
        Fri, 12 Jul 2024 09:44:36 -0700 (PDT)
Received: from localhost (dhcp-141-239-149-160.hawaiiantel.net. [141.239.149.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6a122a1sm70918095ad.45.2024.07.12.09.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 09:44:36 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Fri, 12 Jul 2024 06:44:34 -1000
From: Tejun Heo <tj@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the cgroup tree
Message-ID: <ZpFdcteO8CeZ94Cn@slm.duckdns.org>
References: <20240712164354.65cb32bc@canb.auug.org.au>
 <20240712165107.7b46a640@canb.auug.org.au>
 <8734oe1xak.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8734oe1xak.fsf@trenco.lwn.net>

Hello,

On Fri, Jul 12, 2024 at 08:48:19AM -0600, Jonathan Corbet wrote:
> > Actually my character map app says that it should be the two bytes 0xC3
> > 0xBD in UTF-8 (it is 0x00FD in UTF-16).
> 
> As you observed, the patch is encoded in ISO-8859, not UTF8; that
> doesn't fit well in a file that uses UTF8.  One could argue that Sphinx
> should be a bit more robust, but satisfactory results will not be had
> regardless.
> 
> An encoding check might be a useful thing to have in checkpatch.pl,
> methinks.

Local env is utf-8 but I saved the email from mutt and then applied it, so
maybe that's why it became iso-8859? Anyways, I'll fix it up.

Thanks.

-- 
tejun

