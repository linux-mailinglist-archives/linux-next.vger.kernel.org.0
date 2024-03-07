Return-Path: <linux-next+bounces-1536-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 591F3875716
	for <lists+linux-next@lfdr.de>; Thu,  7 Mar 2024 20:25:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 145322835B7
	for <lists+linux-next@lfdr.de>; Thu,  7 Mar 2024 19:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBFE5135A7D;
	Thu,  7 Mar 2024 19:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lfzr0luF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F28E13664B
	for <linux-next@vger.kernel.org>; Thu,  7 Mar 2024 19:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709839509; cv=none; b=Qxn7xW5zzcb+CVaNtspcf7sMsphCZhrSZKtVzk2RYMQkrPAm5B9wVaVj2AhuX9HGOHVS3gcMnDlIJZYxgCS9K2VrZh+7BvcppW79s/4S3LOUF36E9bvWNMAKpMaBfxT9TL7TQNeiR7YyjNNszajYd8HQpWRHWmL/L833FK2CIN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709839509; c=relaxed/simple;
	bh=oEjMPJubQwQ+yWGuBB6rWcBvplbsprHnS4lKv/UZf2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GWO09XNaWlcOof881RBcIB+F8/T3BFwqePJa1I4A3SmCpSk6N6ohE3K1zzsCpTK8bibJOkAWpxTyXxHC9sRNqS/ru4Uh6iUNCjKyOCNPvwmF2lRAcbknaFxlGukwLcoQ2uWvihCB8p8NlNzh7kT2vKI3/pEFMnPBpe4M1SwUpb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lfzr0luF; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1dd5df90170so5736695ad.0
        for <linux-next@vger.kernel.org>; Thu, 07 Mar 2024 11:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709839508; x=1710444308; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j5DlqCDcPf8EWWXtnaR5E80+mf1MXP/hKxTNVmmfHrg=;
        b=lfzr0luF6IMg2BdP2uO75Y/EXFfucKeCJ9+VM+UngEgzn7e8goRDaHqfmovCwGocHl
         xqtG6WPoi73ek60KiEI23luRE3EhXFTzsMQ//OTvEhXCd2hdVUhjo/HLk/JGO3egLLG7
         9dBsMzuheTmKfWY/VSzqdSk4LudOuiYbS7xbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709839508; x=1710444308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j5DlqCDcPf8EWWXtnaR5E80+mf1MXP/hKxTNVmmfHrg=;
        b=QFnmaq2GaRnKc0FaRyJZLv4/zJ1F+cZi0IPr1IqMTz0vqEiEnfOEcxhTBy+oiaztry
         XHmmnmYTf500hmz2U1pnJ92r+2TQVyG+KDI25xYdWVOaRwkpGG9MznMgq8NnAlHD9abm
         N+C8Vu86uiyXnaB+ZkRMWvCVuNPAXgJHABym41ZiaKTHOsKFwDjz61MV0TRMxlh1Ytir
         n4EOJeWcO6bE+uprlML9OHdXYoxn4Jeq4CQkPW7UG8cF8/5nQbrjrzw65Fg+Ojl5UcM4
         D6w/zRwgwNp9D9GAJb1Vi9mDO0ue2LA6xrJ+vld5xv22XlQaxR0NibagTQkEpz6guujs
         r74Q==
X-Forwarded-Encrypted: i=1; AJvYcCWv+2slSCasW0Shh8yvFEE5D6zQlesu0kHEZWzrYYB4RIQHntcuybq14AJnCPiHIDkTt7Sza+LSUmLySkUAAmX4dNLSXHuKfmp9cg==
X-Gm-Message-State: AOJu0Yynh2UGla6gDn9w93KUvUl1q3DfmPFF72RzUjQSwwmxLX1dh89B
	c79kHjxcn9tl+Wrt79usWQKQphjJbZVMKNceIx7w8IF2bQDCURKv5qfSoD86xA==
X-Google-Smtp-Source: AGHT+IHo7EsASiOmxXFqs8Zb1/yv8lcNgfCtRpzQ8cUgN7QpnZcXS9cPD0omc0MWoR4KVtDZ3FWjVw==
X-Received: by 2002:a17:903:1c5:b0:1dd:66e6:ec81 with SMTP id e5-20020a17090301c500b001dd66e6ec81mr76517plh.18.1709839507714;
        Thu, 07 Mar 2024 11:25:07 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id n2-20020a170902d2c200b001dc2d1bd4d6sm15050839plc.77.2024.03.07.11.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 11:25:07 -0800 (PST)
Date: Thu, 7 Mar 2024 11:25:06 -0800
From: Kees Cook <keescook@chromium.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the kspp tree
Message-ID: <202403071124.36DC2B617A@keescook>
References: <20240307171603.45e9c8b2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240307171603.45e9c8b2@canb.auug.org.au>

On Thu, Mar 07, 2024 at 05:16:03PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the kspp tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> include/linux/overflow.h:408: warning: Excess function parameter 'initializer...' description in '_DEFINE_FLEX'
> 
> Introduced by commit
> 
>   014dc22af922 ("overflow: Change DEFINE_FLEX to take __counted_by member")

Thanks! I've fixed this now. (Weird that kern-doc will take "..." as an
argument name, but "foo..." becomes "foo" not "foo...", but okay.)

-- 
Kees Cook

