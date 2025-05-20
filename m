Return-Path: <linux-next+bounces-6852-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AD838ABDCF5
	for <lists+linux-next@lfdr.de>; Tue, 20 May 2025 16:31:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D3D27B807E
	for <lists+linux-next@lfdr.de>; Tue, 20 May 2025 14:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A09242D79;
	Tue, 20 May 2025 14:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WNeGoMQ1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB06D1DE4C8;
	Tue, 20 May 2025 14:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747751192; cv=none; b=EiCvgzwPr8B0WmhK5brveTv4tLxQLkxNIzR6iUJ8DylQmhVt0ucLQ8Qa+UUJkqyjotEXzGHdBWK+ABZqgX9v+wIS/J6YB74GuiOD5m9c3rJllAnuwpnOqGP/Mrmhh5SOLm30upsnkCcOIfARIcYZDhIvndBVJ1WMlh8R1d2oRY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747751192; c=relaxed/simple;
	bh=ZtM8HymwjRpa4r/+VrmyUblBjbL0jE0MZBcZYl6E1Kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T4rfoZId8sw7Xu0unpAKEb/S06EsTK2o2eTHsBicLB+rEegTmwxHa4sPPBfx+TNeO5EuVWIjomIaQTzBREF39uqVm3i6cl9kzw5B8pXexncnYbK2LyPKau6+gBHCrXEhn4bkFEHdr67SsZtuvsMGFkAy7h7Rbq2Kw/zRfjnoHDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WNeGoMQ1; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-30e9397802eso3063560a91.1;
        Tue, 20 May 2025 07:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747751190; x=1748355990; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L0Tm3GCBi6vLsy7D+z2KRU0s/k5XepKUj2ILkkOMEHY=;
        b=WNeGoMQ1qouv7mW+SkZyvGZ7cdb3FaGlRiDB8Q2rs+TT4+lnBG77EWqK1xpFxSLxcF
         nYOeZ6TQdVRejkoSmYg+MRZjujjSmp+nVOpZMfDT/fJSlb24gCZBQhRIUjYFeRaBnrtp
         sy3bvvuZHxrwKCsiVT72eNCe79bnlwu+7WeGp5MfjvPKuskQAixY7BXOz2o1r0LXx8VC
         hqOs4tClfJa53i5KWZjJSuZucUjkKFQBXny4iGZejp9X9BMiwTe/rqotyTOJTpME4tPW
         MKYnLC+umB/jCCWDY3M516IZAbkV+D4GO24ejOuXXChps32WSLFAvHZF30QfadekbT7b
         rxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747751190; x=1748355990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0Tm3GCBi6vLsy7D+z2KRU0s/k5XepKUj2ILkkOMEHY=;
        b=pEq/jpCYVuZ9JXxAg5qQdmZ6fjQRUOmXIebsd6S47rI1UOuS3xgwVhTDUFOWNAdnt/
         UwxjSPDFm1lxAYNN+oAk6PSBdDZq1lVoQPD9N59dmtd/4sGPImOKnBguEdJtDqn8opDG
         Rnj7VIZAGdaHBTjeHw1YjmAtOKXTe/3FinKHrFHnik8DdEE8RaiLrcdPf1yaPmkGt08M
         rEEF6C8yR+IYwt0JDuW7kBS69TJAC2Ra5nX5D6RuvAhPYhNyStnQLiIAez9sRPKy4RTK
         YYCqE59fyWgNVBAG16kadSHp7l+M7LjVIbKqIb1agwDRCn4rMArIj9zn4K2cE3w6uz3a
         UvHA==
X-Forwarded-Encrypted: i=1; AJvYcCUgsQjCaHHNlMDPH8da1j+S7TvhYcr2mWp1g4hHtykXMrzFH6NRWYgomeIj8JhbGk3yZpC0cXqAq9oJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc4aiaLIgDUH9VCGc+WJhJptT6f0vWI702uC/6rfMOIHzrQ6ql
	sEI2joA3GOgEr13NbHbiJDbI0h8+tsOSc7gmwGseeta3pRAw0cjJ7s1izYlT8A==
X-Gm-Gg: ASbGncuHBhrmD5tuVi5q6cy39IIbVS21nYuln7ZpFgI8fGMKW/wvpumzgBOyx7XyQdk
	fVTmTmLhmOJsIxgPUvi6POWU8uwTlDDsGWO8Ug7ZTcyB+qdbaK8t/p3gFvQLFnpyw6oV8KhfnUs
	2q/lfoVWS+kDhNXzsp2rusvuXg3UdBI5VNfMNeg1WPwqzvIp3k9QyPGAVtIXaHtaMFJT19245dp
	/kamwPjpnhLQ8Cn4Ho35raeRsAIKktS8DPP/qPZ/pHuVj5MHKMSlzm3ub/8HJ00eHqkaLwrcyR0
	KwvVni7w37raiWmVbfOScHlUeabuTIB2N44kJsB/tSA+Us/FE9U=
X-Google-Smtp-Source: AGHT+IHYIOIAuhk11EIovIpIOAIDDWJWg1YonjTm+F70yXNzlxFokQNM7VD8RRIqFwKZeVm9w26k3Q==
X-Received: by 2002:a17:90b:1343:b0:30e:9349:2d88 with SMTP id 98e67ed59e1d1-30e93493309mr29676246a91.12.1747751189862;
        Tue, 20 May 2025 07:26:29 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f364fff8asm1752142a91.39.2025.05.20.07.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 07:26:29 -0700 (PDT)
Date: Tue, 20 May 2025 10:26:27 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the bitmap tree
Message-ID: <aCyRE_QZ4D8Pxbvf@yury>
References: <20250520225136.026acdd6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520225136.026acdd6@canb.auug.org.au>

On Tue, May 20, 2025 at 10:51:36PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   abdf5cc6dabd ("net: mana: explain irq_setup() algoritm")
> 
> is missing a Signed-off-by from its author and committer.
> 
> -- 
> Cheers,
> Stephen Rothwell

Fixed, thanks!

