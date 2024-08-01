Return-Path: <linux-next+bounces-3205-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E917E945148
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 19:06:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F4FB1C22143
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 17:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B21A1B29AF;
	Thu,  1 Aug 2024 17:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KhYohNDw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24C23A1DA;
	Thu,  1 Aug 2024 17:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722531965; cv=none; b=N9f+icMt+zhjZIjuOWAk+96KCGFRjtkIA4wGE+fYM6blcTulFtH8n6Gfi3Y47wNz+i6LwtCtp+9gTIxW905khc9PJh+mePkw1D3nQNv0EPtndbRfnR7B7kJbOg57cKi0qLWOHjfgqONiB0GvNIYfTkrIQVexIdgB9Mf0sP82ASo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722531965; c=relaxed/simple;
	bh=vo+1eCpdc7gCfztdUuXlumlZe+6DWz4J/QnO5ZMBwls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vt84+agA8c2luW/Cc9zwDO5geGUI9W1MKJdIIZO86nn+o+xzMxhr0BPWt8nDyHcSjMqYaNhBzFKn26Xhyb0mlYIDbwSgYmfPFbNE5GDhh1OXimqBPkIVsWnuSfpTuvpCpcwWJBN+XTwhcQaTg3KOl9MXUeTAaRfQwDZOVr7TfbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KhYohNDw; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-70d2ae44790so5193511b3a.2;
        Thu, 01 Aug 2024 10:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722531963; x=1723136763; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7eIYduuLszwxjPpNe0UZg+cxebfMnyI80jFPJbPpDSU=;
        b=KhYohNDwCeR2sUsaizUreihtfNN/E3ldLcnrURPLOzquaX8Zyg7lv0cr7NPzMugAHL
         sOIKA6BnYoyiN1yMZFLYS+3yMpbQCDlpAdYEJekp5YchLnWvIm1636CNUC3f7Nn33X59
         HNSWUmYol4Wcsd3IG6EkigSVLidDRFq0URaac5rOCwFaoL5XM+h70FPJ7pA+UrQwE38I
         +36xX68PTWBYNspugkxEwvfKskp/Ni6w1AYfliRkNSG3wiecjqSPjNABE2oFxqdujhEv
         tUDOl9quZtFbrEZLcdUOtI9h+vgKQS+1czIE66wxNaM0ISgwaMD6g/gMO/2thleV/QuK
         3Ilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722531963; x=1723136763;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7eIYduuLszwxjPpNe0UZg+cxebfMnyI80jFPJbPpDSU=;
        b=U0onkErs35r+YL+S3Oir8Gsvz1l/QVLToSFX8a0J+bTKCX9tfEVNkl3m3g25kn8Zd1
         FQrzrb9jS94EhTw1rewjYsiyIhJb237VneeEHsE9234oMW5r7YaBWTUkg4hmR093W/O6
         D4iHywGcD1Jabdkkh5BZCSx1yaNBxOUdaDUhDuSvTCI3HKG/H+XKA2jS5QFpn9+blfjN
         pfvFTXMCNyASERk9V2BuN1NZshHYuwlS2J9pVM/QePxSQ+QDjBF70w2aOQF7r1yOJ7sw
         CcEye72EQmEbBu2IhQsAq4I8CsqoB+91ZagRyyGM+KrfvOGhwh4VVp3Ap89b6hialRBi
         lJQA==
X-Forwarded-Encrypted: i=1; AJvYcCURK5Wxyt1RBq+UYKWADhVrOtZQB9pynrsXijuMdpRtieQ7OGQd7qAYf/sLQ9SNETVcbxA+bGk0i9PG9zdhiehClP+GSXUnAyhGdPFCaixWs7F2E8lS4EX5QFk3K30FbfhSEAJMQ3GcZw==
X-Gm-Message-State: AOJu0YwomkO/CZwxnDo7/6UrQPrn3qqS5buSgA39oKi6JI5OUqbTXvt9
	st4u/RFcjIctlVfWSi4BCMUxg+presvPSs+zdTHRkr9ho9NrhnN69XuTYA==
X-Google-Smtp-Source: AGHT+IEcWcNRK/hl+P6Sv65Qwqr4TWL7PRq82MZ1mf2DaTfNYj8wdNpRUGjIUJUDR5hGSv4551KkEg==
X-Received: by 2002:a05:6a00:9282:b0:70e:90fb:49c9 with SMTP id d2e1a72fcca58-7106cf8fcefmr1002509b3a.1.1722531962927;
        Thu, 01 Aug 2024 10:06:02 -0700 (PDT)
Received: from localhost (dhcp-141-239-149-160.hawaiiantel.net. [141.239.149.160])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7b76365b69bsm101521a12.35.2024.08.01.10.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 10:06:02 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Thu, 1 Aug 2024 07:06:01 -1000
From: Tejun Heo <tj@kernel.org>
To: Xavier <xavier_qy@163.com>
Cc: sfr@canb.auug.org.au, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: Re: [PATCH v1] Documentation: Fix the compilation errors in
 union_find.rst
Message-ID: <ZqvAeam7_iN44C88@slm.duckdns.org>
References: <20240801154823.358ff7b4@canb.auug.org.au>
 <20240801071523.463439-1-xavier_qy@163.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801071523.463439-1-xavier_qy@163.com>

On Thu, Aug 01, 2024 at 03:15:23PM +0800, Xavier wrote:
> Fix the compilation errors and warnings caused by merging
> Documentation/core-api/union_find.rst and
> Documentation/core-api/union_find.rst.
> 
> Signed-off-by: Xavier <xavier_qy@163.com>

This patch doesn't apply on top of cgroup/for-6.12.

  git://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git for-6.12

Did I apply the wrong version of the union find patch?

Thanks.

-- 
tejun

