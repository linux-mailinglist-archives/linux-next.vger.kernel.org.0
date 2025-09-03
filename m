Return-Path: <linux-next+bounces-8176-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0CAB422B9
	for <lists+linux-next@lfdr.de>; Wed,  3 Sep 2025 15:59:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BB457C60A9
	for <lists+linux-next@lfdr.de>; Wed,  3 Sep 2025 13:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 263BC2F4A14;
	Wed,  3 Sep 2025 13:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b="WfyDh85o"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4826B30E838
	for <linux-next@vger.kernel.org>; Wed,  3 Sep 2025 13:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756907915; cv=none; b=s49XvWE7Fgl2O8aMLrT+H2DindmvVeidACb95I/IsOPWRG+denW+CJRwOJ96JQFuAnylmOL21PTL9SmiEsLf7wt6YARxMZ9UQ4ARKgbM/vtg+crKAR2ZT6ro8C9Pparo1UswSLC7EnZ5T3S3m21ezVUV+EwEhe8HcTyVPcNxxug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756907915; c=relaxed/simple;
	bh=xl0glEP6JrlzQ+3dkuOOf3iQY3odHY+N8qCak9u7MI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bbM94TzOEcO0qNd+XG9BkWmBvCfU19w9ceVqzKbXX3LHRf+KLesBb5SAd9TKO+RBsysMtv5wpedBspHxYbMfN0EwNwCx+9RPnLkLk0YLKPWqRyzLMMeJwATxcmeQlWf1SqzqFnmATgiM7UpPmJ4v38bfzBvwZKU/BNaymSWqsgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org; spf=pass smtp.mailfrom=wbinvd.org; dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b=WfyDh85o; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wbinvd.org
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-76e4f2e4c40so5469068b3a.2
        for <linux-next@vger.kernel.org>; Wed, 03 Sep 2025 06:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wbinvd.org; s=wbinvd; t=1756907912; x=1757512712; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IYhqP3Hm9EuAg8xEarsmwy9i7Vc2989OjAjHKpyrOK0=;
        b=WfyDh85oCSRDDg7Umcllnzs+PeyHHCkL6iZyEVF4z33/fRtdieOzunM2lxIQOeGNso
         Uknm9YdeXDfaiD7HV3aoKQp65RCxKLhP23paC5lgJyQNRv+/gEZTc74/l/U3FHbmlHMF
         HxsTaVCz440CgpHHW9qfDkMihq60hDI/P1Ff7xRnh6GkLq0ZvsjvK3eqiPQzpUBUs9Ma
         X/OUQmnoKdvzUVwH036g0wrHeOF1zd+UsgDLFPFKXvU5d2AUmm+qKjj5xMjXX7l8Viwc
         jXsL8f9wlhEfbQQPXfHch06nvpOFsXqlW8MgHc5C1sgvKi0TUmPM6UMxd1PP7IhqrGJH
         vmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756907912; x=1757512712;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IYhqP3Hm9EuAg8xEarsmwy9i7Vc2989OjAjHKpyrOK0=;
        b=hgNmm0j3EVdPbh0aK6tBSp98ZNNAqo+yQHwJjH8kCIwAETc8HaPlA68pauG0xiaIFm
         WaZ0OWhmX6MykfnaVoCQZha+kTpR8FcJuZZxtsDveszvA/haapESrC6/r/fg7Wr7H1Is
         dSgVP6+MPRpiviRpWJFAGesIdU/FTqP4siqX9jx9OVAywtgINC7hMgZand9JVAmr4R5S
         VO5lAc+BUytq2hPdvNe6+dYQDvS8+zJijBP9Ndyn6C6kWu5nazpY/luWZOwvXJNY3D72
         BMDooo5JUnKkCujiUW6G7DpKSvniGXD3kosQ6JqLMFIdYUsHu8MEF6PY28CZjmvtIv8i
         V1Xg==
X-Forwarded-Encrypted: i=1; AJvYcCX+FuXAXbNld4D0IXo6r1H74wRjiEXapJRRDatMo2galk7Zi4FIbq2QNGRBQlr+wE2cudkz4SeS5vDa@vger.kernel.org
X-Gm-Message-State: AOJu0YxQQXxVoFeisYI75RVKS3lOWEZ1DBRdg7UnsOIx6LGk9/OtXUSm
	Z5NMknmG/RQUCHi4ipBQKB6V6etyZ6oOk6KP1Bmdfmd4ykFjtViMFdTnSNuf7kCKX/M=
X-Gm-Gg: ASbGnctrcKG3zaFRt70ohnQu1wBO+Qoj6TbWWPSddVI3dn6a7Ue02PhYAiPC7fz0Xys
	290a2s8zlkT28LWNB1eY4z/rWIozt7HdERe7G/RRMA2qTa1CWniR+cte4ateNCY8t2DuNdpyfMX
	irRtxI5TxxbFCyDra0pS079Zwms6ofoWO+t5mI4a/kc464kd9y22OgHMnmdvgBxgEFup3mbK/LV
	UWOGAhmITreaQbu2p91/S9bkERm7+8O16ULgUragXlHhm81SvWWw7bsxdDMdtGJbeNlzTsCzogM
	g2/7uOwRxgBiZ2YPK7A070qg4/V3JoqY6WZ2g/YxtUfuQA326thuEPXkWE+5ihDKyj+zh3DHvRU
	EVIWum21gf9IMVQ4xSd5k1Grd9hlWaPvw/xM=
X-Google-Smtp-Source: AGHT+IGHwfhhequr4wD9BiiMXOCBiCA4MDXMEmUM07tc/6fdlQYpI6gjpWkgn4DyVBMW93fvWaS0vg==
X-Received: by 2002:a05:6a00:2e06:b0:772:78e6:f61a with SMTP id d2e1a72fcca58-77278e6feeemr5450945b3a.13.1756907912317;
        Wed, 03 Sep 2025 06:58:32 -0700 (PDT)
Received: from mozart.vkv.me ([192.184.167.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7725ad1e086sm9163073b3a.20.2025.09.03.06.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 06:58:31 -0700 (PDT)
Date: Wed, 3 Sep 2025 06:58:32 -0700
From: Calvin Owens <calvin@wbinvd.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the bluetooth tree
Message-ID: <aLhJiA5hh08RZ9Fm@mozart.vkv.me>
References: <20250903092346.0cb5db2a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250903092346.0cb5db2a@canb.auug.org.au>

On Wednesday 09/03 at 09:23 +1000, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   16ebf6c26de5 ("Bluetooth: Fix build after header cleanup")
> 
> Fixes tag
> 
>   Fixes: 74bcec450eea ("Bluetooth: remove duplicate h4_recv_buf() in header")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: 0e272fc7e17d ("Bluetooth: remove duplicate h4_recv_buf() in header")

Yes that's it, my fault, I'll follow up and get it fixed.

Thanks,
Calvin

> -- 
> Cheers,
> Stephen Rothwell



