Return-Path: <linux-next+bounces-6585-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1109AAEFFE
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 02:28:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CA849C14EC
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 00:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E41B78F4E;
	Thu,  8 May 2025 00:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="IzuUtQV2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B210F208D0
	for <linux-next@vger.kernel.org>; Thu,  8 May 2025 00:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746664132; cv=none; b=l30nFt2FxrFjw3ZxDqpH5PyKThfzrm8qDat5cUXdcjQDkHAQtElic+wt6SDc/HSsPOfVKouVxPDbGNip1WoNporcYLW/urjbxRQJOKYPuc8q7jcpvnf/wuMPbtKishDFxZo5xxZav/0ixhKF3xHg9SNkT51ru1Mzv+UX5vPJbs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746664132; c=relaxed/simple;
	bh=Y07RstIIdvctXcvte/3/DiHgKlO8xbZ2zrIyQ+Rhzc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sGANkZGTdUhRgriOKdSsYEoFuavkjUfc+oL/u0dFVaFfhyUSBvBHdtPt+g7H4ltAnuHr7woWLb1jPGzyEGv1ZkEbzgngr5MFnChOagBbyXBioaIrxoh/T/AuUJ9Bbi2hsHa5BzsxEmwO+dmBnPPYv1Y3RVNkFwMfZV481E5Y/7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=IzuUtQV2; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b13e0471a2dso236696a12.2
        for <linux-next@vger.kernel.org>; Wed, 07 May 2025 17:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1746664130; x=1747268930; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rS+U0/mqHWG5lfLT69s9lUlVJUsqGvVjuXAMIKBkTLc=;
        b=IzuUtQV2D+KvusyTsCg0RRjiH0oymygHK5REhctS2DwK04dlM2Fgx+XBSygC2sv40x
         egW/f9gQncUtse0uXP94engJshUcOm1rmPf8CDr0LUkPFoZXI7ewTFAxXiYU85fIGpw9
         BfhKeyi0Vax7IkttGLb4Gd9QUwgCw5rlZb6sEUZrCq3NomImz3Nlq56syCLLetTgcaJk
         lmB93oYOjBd9lN4VF95G4HzD27nRwzs8PGFNnfmatHDkCYNW4GDb/vDfoTUQXSwWScbw
         t1KGn3hq73SqhQHmeeDt0K7Zgn/TnFYTvSmVfVIKwUWixzP6Ym8NWYHustxsueoflREm
         0w6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746664130; x=1747268930;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rS+U0/mqHWG5lfLT69s9lUlVJUsqGvVjuXAMIKBkTLc=;
        b=krWpxPZcG9P1EX1Zh6C/616UZNO2XCEaPviajTdD1RBmejP8AIfVv5rIsnumsEavS7
         dXn0sIiWy8pSfhnfA3xYwu/hpc+YpFpMUJfpDhYA4jqZBUuHQXOXZRKhYzZ2PW81ClKA
         +97U+VeiTzd0NEewnfGFi82JvtdOnDtZH61/2FLqS0LMI0Gy6PelTRvF/p3YqRGVcy+e
         nqHIGLirW8pZARA6e4G1CmcB1UV+ogV/h6+V62e4JHds1xLOi9n8XnPrpH0Xnn9ataEd
         A3lFUroawG0xMX709RUOUu9BvGoqbtFxd2rAf5qRMAo3qvP4Elvh6MjTBo9cxqRWt7Wo
         xtbA==
X-Gm-Message-State: AOJu0YzdFngLIhHToiFmlApB/o6ImmICOvM1ll1MsBgaFZhdtKjyIusA
	qMw8cxw9D3LT6rVtnvioef/bvnzrYhqlACJQ3T0z4yK7jPeOJoEsHaSzyzc233k=
X-Gm-Gg: ASbGncvfhEPNbK4t1cyqklnvmMGXCOVGsCHEZy6zls/dCETfAuoSPvcvS7Czdk7OOhH
	tbJbboCwQMcbzLIruddPWdYlMTFCVihUIzdkaNls9wIiVzI9eRWpEUVMtnnXas1+t98eV6E6T9X
	JnWRriGIsEriAD+YInihm9W9eZRylCCMIo58k6AgXMapHRXKKOr8/S4FKQXKFvj9E2dBvHIWAWk
	zwS3hQt/sJBfZMDiawi21PLv20WUWuQNCIGSDJnQWmq3eIyERDUaV4f18UOKGaIp0CbHC6D50sY
	6i+bsnbO9JOygjbljN3HdS7W/4I8Aj2j4x4GauCSTZiXqAo=
X-Google-Smtp-Source: AGHT+IFq0W9eeoSq5bUfXHKxOZPIOOgjmxfCPv6cQ0U1CNtWqAfBDIHNsC+ZooZnSpv7K8wTVnRshg==
X-Received: by 2002:a17:90b:4c88:b0:2ff:796b:4d05 with SMTP id 98e67ed59e1d1-30aac19c279mr8525757a91.11.1746664129934;
        Wed, 07 May 2025 17:28:49 -0700 (PDT)
Received: from x1 (97-120-122-6.ptld.qwest.net. [97.120.122.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad474a05bsm900814a91.2.2025.05.07.17.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 17:28:49 -0700 (PDT)
Date: Wed, 7 May 2025 17:28:47 -0700
From: Drew Fustini <drew@pdp7.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: Add thead clk tree to linux-next
Message-ID: <aBv6v5mVX3ofsRyG@x1>
References: <aBvsGRZqbz11HPwM@x1>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBvsGRZqbz11HPwM@x1>

On Wed, May 07, 2025 at 04:26:17PM -0700, Drew Fustini wrote:
> Hi Stephen,
> 
> I'm the maintainer of T-Head SoCs like the TH1520 and I've just created
> new branches for T-Head clk patches. Please add these to linux-next:
> 
> thead-clk-fixes git https://github.com/pdp7/linux.git#thead-clk-fixes
> thead-clk for-next git https://github.com/pdp7/linux.git#thead-clk-for-next

Apologies for typo 'thead-clk for-next'. Please use this:

thead-clk-fixes git https://github.com/pdp7/linux.git#thead-clk-fixes
thead-clk-for-next git https://github.com/pdp7/linux.git#thead-clk-for-next

Thanks,
Drew

