Return-Path: <linux-next+bounces-3218-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 652F194637C
	for <lists+linux-next@lfdr.de>; Fri,  2 Aug 2024 20:59:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 466861C20E45
	for <lists+linux-next@lfdr.de>; Fri,  2 Aug 2024 18:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EE641547C2;
	Fri,  2 Aug 2024 18:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ieM3XIUQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD5F1ABEC2;
	Fri,  2 Aug 2024 18:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722625139; cv=none; b=ahlc4ivrg27Pd26jiYVpqZjxeU7W9JxJrfQA7SVIzp9Mqphrxz362A3PE/59prUFkeVmh2VNPzExKsXBYLyTqfBE7hQmlu4cO8UTLZj2h+Du3SHh54xROcjb35BQ8kEmuss6mK9dhN/cGz+WtUeUFM1Qu1TS/aZFgV3vaM9az7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722625139; c=relaxed/simple;
	bh=K8ddkoxm3C1nB3L53StfamoAtWc4pJlscEHXJCWcn4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qqhxFSybwwR0az3JwY62Po7ng/j3DnT2kqfFBJNzzcvsrV+xtGzQb2EN5FDC5x/SO3YOotYikuhGCoIIlRlL4i+777Vp7Zpv5hfhijs1NKCnFTiUlZcCC5IDwKm2+Qrio0opOpOUhZbVHYYUavLg/AGD5u5zTTp66DgxYLzon7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ieM3XIUQ; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-70d19d768c2so6603489b3a.3;
        Fri, 02 Aug 2024 11:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722625137; x=1723229937; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7HBEL9KEPrHUySlWotkmtSjR9oMPQS+D7NW6xshQG7o=;
        b=ieM3XIUQ4O3SQ4DNJEXGx2cYyqYx7PYKpc2hS/T3fWXow90eFiUSZwR/GAxI/4pr85
         gBIWFOfcoiMABQU7r9koLHHH0QED31cHVDlG7rDwX3H9OA7EjkcRK6AdNwnRk9JQu1r9
         vj4hhnn6+PPp+wwx+7LvKTnQTuJIRN4NC8mgQSKMJ2XYJdTxuypkv2Nf3aGuc00z57mX
         r0nieKePj4rsh9g75HsZZETa9gJ4tojXjMmKQtse7L6RyNtxOGbJe2zfw5oPDKB3+P80
         Er+HieeV+QHm2M8NcbT/0wuesHyIk5zrUT7azPekKAzQBBBha131VdjLxQxHUsF/gD9S
         zetA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722625137; x=1723229937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7HBEL9KEPrHUySlWotkmtSjR9oMPQS+D7NW6xshQG7o=;
        b=AkI975nFkCRDoVi/Y6MuqrlyDABg5AMh3/x5LAT9LQxWtxvKTkIMrSozoeNIiW8yuH
         BGxYw3dsqSqwGWSN8/dbC2wA/+SLHP1dIyFoDruo8JVtUE49GwqFMwckShJNnZAghg56
         /01f5ddzQo6kpabHahZIsavpbVSZfYNXxheqHBOQVWDgFSITP1ajHffh6SiBFPqzLaDL
         1yI1JAAcZIdrnjxgX/KnNCH2Aa1aI+eDqErSnPfwLhmvlymz6HICyaCLT6QyoMH6gdDS
         EQ+OiyzDeD60ypMjGNNjarfvrF6oB6KKjXg8I9NJHcTfRY717DKFcfWjJNu73qczOLqq
         tfAg==
X-Forwarded-Encrypted: i=1; AJvYcCUqKJEHKshWre4DEmCUvMGEmI+LucrDcE7JXYvJiiMufRqqkW2DCfcNUdtCEcNi5xeo5SiC0GcXywYA0g==@vger.kernel.org, AJvYcCVCccTjJXPvwjOAs16+xG+UwgL9g/E/nptkLKEyemqjM4nwbAJbckxDtPq9ixiAHyQlZxKRIEZBJu3Jmdk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaeqxbbRL3ElOFOTxWbb45miSIKFg0MsVKUxdCVlAeYVH7BrV8
	qUMuTAeytXSmT4TpogYaTgOdmYc0lwC7OTzqZ4DnVZQOlFb4v6+W
X-Google-Smtp-Source: AGHT+IEI2SvbXP3lngtOdFq2NbmSoqvD+qfb0NDypYClAfynPsgLsRKsK37/dWFItErRsUKa0pB0DQ==
X-Received: by 2002:a05:6a00:13aa:b0:70d:2b1b:a37f with SMTP id d2e1a72fcca58-7106d02f8c6mr5559741b3a.24.1722625136789;
        Fri, 02 Aug 2024 11:58:56 -0700 (PDT)
Received: from localhost (dhcp-141-239-149-160.hawaiiantel.net. [141.239.149.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ecfccd3sm1701642b3a.144.2024.08.02.11.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 11:58:56 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Fri, 2 Aug 2024 08:58:55 -1000
From: Tejun Heo <tj@kernel.org>
To: Xavier <xavier_qy@163.com>
Cc: sfr@canb.auug.org.au, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: Fix the compilation errors in
 union_find.rst
Message-ID: <Zq0sb2zfV-sJ4hRY@slm.duckdns.org>
References: <ZqvAeam7_iN44C88@slm.duckdns.org>
 <20240802033346.468893-1-xavier_qy@163.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240802033346.468893-1-xavier_qy@163.com>

On Fri, Aug 02, 2024 at 11:33:46AM +0800, Xavier wrote:
> Fix the compilation errors and warnings caused by merging
> Documentation/core-api/union_find.rst and
> Documentation/translations/zh_CN/core-api/union_find.rst.
> 
> Signed-off-by: Xavier <xavier_qy@163.com>

Applied to cgroup/for-6.12.

Thanks.

-- 
tejun

