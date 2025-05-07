Return-Path: <linux-next+bounces-6563-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68003AAD50A
	for <lists+linux-next@lfdr.de>; Wed,  7 May 2025 07:18:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74669986038
	for <lists+linux-next@lfdr.de>; Wed,  7 May 2025 05:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E7981D90DD;
	Wed,  7 May 2025 05:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4BEZo3a"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D940E1DF25D;
	Wed,  7 May 2025 05:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746595059; cv=none; b=P1+ZLuuhX+egrLQ1cNw6zfRjtAxRslPAB4/paqZ9LUgXTApI92P7z6VNzoAri+nzOU3rfqzASvBd6Z7x+Ldo7dxdLqfFUdpQtwtZvKsmuTtDYTSjuguGJqrZUWdxq1Mn5srUHdZHkeKa1eX0tEDifUzZcCDyuvJhu4tuiC3WWpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746595059; c=relaxed/simple;
	bh=2AsaNlRoc3U+x3MQpb2BPi/VzglI/tL0tT342emVsag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YLYEqHZy70y45IxQ8TQIhmLilzXC4Bx/AWQymTnaiEiCwWwnsxIrbcKOeeeVMZctOFCx2VBWix61GVh0OiVWO7qFyJMySEIDvn5PJNG5xmAbAtIrW9sJmKfKJRwdl+CPQsTPsAX6wH3UxB7//GluTwfAlEzPw8re96+B3XaQhb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M4BEZo3a; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a0b637db6eso58413f8f.0;
        Tue, 06 May 2025 22:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746595056; x=1747199856; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GYYJWdyRGcQqxS7GxD66q5Cjpjg9FTJRCiVLRlUyTb4=;
        b=M4BEZo3aoQ/bEQNpkgzvq4Fn/+gS8SOZTXLTIXRo7BJQ21IGaeQm9pFh57ZTW7Bu2G
         tkOpZ98qhOedEsRNFuuGjW0rNy+Iq6xsLwI1x3PALukoCpC7qQa/aGSwZ/D7hokQ4Kp9
         EDAx+z92rl7Ac1+PlSEvyb/9Uwy+K3EDRN32eEJXlL0/vVD3VX6ZB+dmQsvts4eJApAp
         z2WmjeOQWSXybCTApCSgCqHMBndEETEEwCYosFQASWHlAoRJR5nqozYWbkpD8zQEpNtq
         a6OgexXeVgSDS7qU0O1vDu7LC/J2xoY/rI05vUIPsiKAb4dtN2o6ubo7mk3H9CwK4Ve/
         leLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746595056; x=1747199856;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GYYJWdyRGcQqxS7GxD66q5Cjpjg9FTJRCiVLRlUyTb4=;
        b=b1DUAJ5XjsZokl/JbHAWOP1hWWrvm7RXHiWxXB8gVGyn2ZPDbXuXhxelDEu4+YwzEm
         cZr/0BK+sNYnRC33jZ+2ryKzJ7Wdgzch81GjFjhmFhftm5ASnRWhRPj5ggh1v/lCtzUE
         LsT16bH7f8Otc/rPEIe9s68kumLtdHKWUmo29qaVt83yqbi8evtC5tLxJqSIyMQwkUyb
         dAirRRUI7pEqPhHzrSy6b6Vl1pW+qbvSJUavwwkiFUqZZamD1b7WyioJm1O7hT9eFrLX
         eHGpsIcBrXounRFKDaKMiHMDFm1recg+vK1PD5waTkA/C/CxlStvbgAwri313gYWfPAZ
         nLww==
X-Forwarded-Encrypted: i=1; AJvYcCVHj+LDK74quEpQoDrKyWHPfXwz48sEDL0rpctF0u4i/xKYsBStxzz0WR3tRNMWuIt052WN3KmeNN1R@vger.kernel.org
X-Gm-Message-State: AOJu0YwV8DV4zunzyKnlOid+/cmb4MikSwEsj0EIIQuBihcCb8c4YIJX
	QLTNJINLRcjquavSNkXpXM0ojwmhVd1A2nwkDgUfAftTbx0WG/EXRRiuDg==
X-Gm-Gg: ASbGncvjB0M8HKROXERq3QCSSi4RorK05/u8Gh2jIYC3F3bJhSqoCY6XzJ9ElXJtIly
	B0p8CCrJ1/Da+9l1UuO8sVemKcwHSZCiASt0njMi8SymS0PCycf9PmzTcR1xLCUrSd3dX8WkRpK
	deQ0TMEpGZ8Rykr5YMThOBKRSFZwyKTndN6t1B9HTiY1Xl8l4XVExqf6f5+nINBkX6cRFokpz4A
	f0vA8srrzQPHuVTy18wjaHwyCxQ3HrrQmYqMyu2d3jqtx6aNqYndHioCXC++GOD84IE8mRD5NPX
	MekbDbllu6OYB6YYxWxreG50wpn2Mi8lCe6ie3Zq/B7GCrMRz/POiQ4ipWyHmun2rfvZ/S7t1dE
	92dRW
X-Google-Smtp-Source: AGHT+IGCrqBwtWEM5UFq+mkvgPc+QD9JwyY3gNJteYxxRx5zKcfW6srDTgO8L2YKcsC1tSP4jTXlgA==
X-Received: by 2002:a5d:6591:0:b0:3a0:b5ec:f076 with SMTP id ffacd0b85a97d-3a0b5ecf107mr448983f8f.18.1746595055936;
        Tue, 06 May 2025 22:17:35 -0700 (PDT)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net. [86.9.131.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae0cd6sm15573091f8f.5.2025.05.06.22.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 22:17:34 -0700 (PDT)
Date: Wed, 7 May 2025 06:17:33 +0100
From: Stafford Horne <shorne@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the openrisc tree
Message-ID: <aBrs7Ukt0oEEAUcK@antec>
References: <20250507065614.7df38178@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507065614.7df38178@canb.auug.org.au>

On Wed, May 07, 2025 at 06:56:14AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   218b8d897551 ("dt-bindings: interrupt-controller: Convert openrisc,ompic to DT schema")
> 
> is missing a Signed-off-by from its committer.

Got it,

I was using a new tool for applying commits and I missed a flag.  I will do
somethign so it doesnt happen again.

Thanks for your checks.  The branch should fix fixed now.

-Stafford

