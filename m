Return-Path: <linux-next+bounces-4307-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB9A9A0C4F
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2024 16:15:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46BF91F23EDE
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2024 14:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F9B61DFF7;
	Wed, 16 Oct 2024 14:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGSM4N0N"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF4021E3C1;
	Wed, 16 Oct 2024 14:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729088148; cv=none; b=reLG6EvLYYOF2mWOOMOwiIS+7pZRSQo2Kv1kT5xDPHOqcjVaI2mYjhWPgHvRHdK1f1oD8o9+XXlf/Rpt7QL/JJqZyLzdMvSOY0fNIPtSeMvJMwe6yHrbWPxWMRQsmVmY++6BM4rFB2B/4OpJvXpdTmjNAW76gfsXeG0oVXtrkd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729088148; c=relaxed/simple;
	bh=sPU/i+6j1CmKVIai9BvD0HhO3BfC4s2PkjRj3JHESA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mGFbt8PsD+QEou7uLv4Z1m9f/ToqSPnWF+5oAHYL7T294/+jLIfYImtrpwvfwwQ4MFsMX4hd84yjx8IrIG+wrX4DvRMcityCLh+pUNayqj9TqtyMkEZ6zmBIbdGgLEpUxVKHzXn8i/8bOcWgfurPIaZxdjT74JOgyqd6SIEeIj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YGSM4N0N; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37d70df0b1aso2805723f8f.3;
        Wed, 16 Oct 2024 07:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729088145; x=1729692945; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zGM7+Q7sexVp4P+1dxWTfIXFggc1UrIVMwvAiyMSuLM=;
        b=YGSM4N0N6ts6vY132pucDC4HpkDU9GXXaBRAIUK04BixAbZCnsS3AVrTSD7lpZNB7q
         PNI+Om72fecgnvU3lDy9GigaxJzjFvXkqJV10hH+iX2iFL4ad4Ct0bmWAaPvgCEGpG0S
         5afcURVWoBIAtQ0Yi33sSyANG3VFNTP54jyBhwWc8X9GBopMnpBFG14op9RO7f6i4TbE
         k4qgRod44UFei8g7UC6IKm4OThp2UH0f4gIfqCvUwbSHjTNYveCFQbIY5dh7W57OjyO3
         I28FHcUOW/aTCVlyp9sszkeNuzA7If2hiPB3zVuDwWk4zin1kwNhYO/7zqSRIPta0DUO
         GyeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729088145; x=1729692945;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zGM7+Q7sexVp4P+1dxWTfIXFggc1UrIVMwvAiyMSuLM=;
        b=AmVKnYUab2kUBr8R8n4+uI5N6PjLlSfYm2nOWGU/OFc8WcDhXnQfghLyWfxU21oxwy
         pxNlubkNPobGoN+cR6zCuHXeDPPwu69n+4ygzSPBUjZweLrHqPm0XOAaMuLaaYL2Ovoo
         ilR4kVrwQwNMKJZD4IPo3zqa3cfWv+tGYaX5HoH1RFAqbC9dAh40zUI1NuMU2BO8pfs8
         S7/beJAqVxK8mUk0Lx9N7/xf2vpvD3a2KtnUT+eGmlClU0pCiIz8t0EeeBd5W9eBMfAS
         uLqNdu/vK8vzSIglyGwBn/qyjFEVxzRjxTu4LL66nQ097gwCOaMcvNdZjRq49f8kRtXY
         8ymw==
X-Forwarded-Encrypted: i=1; AJvYcCWlxakDBXwpwXxZOEcbr+VbsbGcwS5n57oMhXPlO89gXpvSj+r44FEEsS2cEpAytBAIunuUak3gGbtRSA==@vger.kernel.org, AJvYcCXAYJxw9xZWw98EZbFoCFY+tROZLzmPIs+R1gKPX5iscWDeix2VGTqPtOoTuSz9TGSw7hCwCDjgILHjtWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVE5cuno3CB2TfxTWj3lShV1ohNiCW+eUUatzZ+hCfBfbbgkQ8
	3QxvRrHTMXhMVjNC9bpDd52m/H/LiRiwG6mITrM5Beee0YC4gqBs
X-Google-Smtp-Source: AGHT+IGzXZWBBbhcqDEcANIBMjfJwHNHsvCKZOE6NwM2X2PuzV5F6ASzd1SFlj6tbS+uwXuqhoE+Rg==
X-Received: by 2002:a5d:6d0b:0:b0:37d:4ebe:164b with SMTP id ffacd0b85a97d-37d86d557a2mr3318167f8f.44.1729088144462;
        Wed, 16 Oct 2024 07:15:44 -0700 (PDT)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa87d56sm4450698f8f.43.2024.10.16.07.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 07:15:43 -0700 (PDT)
Date: Wed, 16 Oct 2024 16:15:41 +0200
From: Dave Penkler <dpenkler@gmail.com>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the staging tree
Message-ID: <Zw_KjYQ7P2Qd8fDb@egonzo>
References: <20241015165538.634707e5@canb.auug.org.au>
 <2024101623-education-buffoon-0988@gregkh>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024101623-education-buffoon-0988@gregkh>

On Wed, Oct 16, 2024 at 09:40:03AM +0200, Greg KH wrote:
> On Tue, Oct 15, 2024 at 04:55:38PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the staging tree, today's linux-next build (powerpc
> > allyesconfig) failed like this:
> > 
> > ld: warning: discarding dynamic section .glink
> > ld: warning: discarding dynamic section .plt
> > ld: linkage table error against `nec7210_board_online'
> > ld: stubs don't match calculated size
> > ld: can not build stubs: bad value
[skip]
> > 
> > Caused by commit
> > 
> >   8e4841a0888c ("staging: gpib: Add Frank Mori Hess FPGA PCI GPIB driver")
> > 
> > I have marked that driver as BROKEN for today.
> 
> Thanks, I'll go take your patch from next and add it to my tree for
> this, sorry about the build issues.
> 
> greg k-h
Hi,
All declarations and uses of `nec7210_board_online' match.

Could this be a ppc linker problem ?
-Dave

