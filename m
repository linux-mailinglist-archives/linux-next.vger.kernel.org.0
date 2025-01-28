Return-Path: <linux-next+bounces-5338-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4525BA2035F
	for <lists+linux-next@lfdr.de>; Tue, 28 Jan 2025 04:34:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66C273A61B3
	for <lists+linux-next@lfdr.de>; Tue, 28 Jan 2025 03:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6D721304BA;
	Tue, 28 Jan 2025 03:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cO2uEqIe"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F169013FD72
	for <linux-next@vger.kernel.org>; Tue, 28 Jan 2025 03:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738035235; cv=none; b=ZYNMzzDMwn1lGfoFW+Ek1cYEVInie7qzVm7DbFLxZxxrrVpRqGNUHDHQsLOgcmD8/tYpu4uTDHS94kUzuYpUjHvxWIEkwQ/4MECHmky0JSaPTas21URGU2lSNyRP5w3yd/45OsTlk6iN5BQXYI7AQXuHqLl9WmMFlx5+NV68En4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738035235; c=relaxed/simple;
	bh=RM2foO3r/dFaSADHrt7lXVMMU+CO8p3d+xE8KF/fGfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tb7T+fTWjJyO+xWSDoMjPHky04IWJZRaY3tQai42g5s634W64qJEu2znl3oyntKzhe0JH2Wo7ea8RtyJQIl1eOv1mvN2wKknTaURfKJ1hFjahTCKbCY/HGWB4OIReOHQ4PV6qkjx/JiWr/mEDrzJ1c9ctjQ/QoWvv1EWTCPy+AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cO2uEqIe; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2162c0f6a39so110607605ad.0
        for <linux-next@vger.kernel.org>; Mon, 27 Jan 2025 19:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738035233; x=1738640033; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eNdhKear+N9tare096OEEEzxqTJ2uGZdyVmq8dSikMQ=;
        b=cO2uEqIeu7l7B9At4vgQmLJRs2L3HoUOvKFasTEv/VoideU3z0gPl41UJMzOOe1jMs
         nQis0dCYJJYnCOmMfzLpQBAti1WQq+Qk+/PES4RV3hAAWmoGUd+tkWYaEsuUHsKcuoxl
         94V5iFFjsysLvG5HlbjeF/EClSsXWVX9pqFN5jDl13OgHU5NIAqE/QYq+/USOCUFrjTL
         MxqVqKIEkaaGU3ivUAOgdh5CAHEsV1Hhk2vE2iGF3MTqSlYai1nTA/3YI4lGDWqgz+4U
         FauEbE9F+1CNsR5rA5kHIo6hTXKvDBon8fp6R9hR4ALfVQCKn34fyWykKNw9Qsr03JTm
         mVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738035233; x=1738640033;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eNdhKear+N9tare096OEEEzxqTJ2uGZdyVmq8dSikMQ=;
        b=m+U7UA+7sZ3SgjunAycCLD4LUfwmt0yJd8REfl+2MKWG9b5DouJmWRbqcjkMUqur4S
         k4NTSPEIdmNBrjS0S7RYsUxVpdd5fxdvqexkI+JKi1X3H/vb9X6SpgZwAf+d4ioMiKRo
         4MzDcUVOXOWvKKP/jIJoa2stncsKv8qWYJhO0kVu6H9Rnbp6mc2r7VDLovAQUEVp1yj+
         Gv7Khixe9p/9lja6NcMoNvsmXFjXJ4nehY+o5zxWdtUU9fBT3dqpL1UqtZHVOorZdn5a
         t+xoZy6QzHclFe1xWKlvUXrqe/tiMZSfw1bnLLWz0aI8PvpFdwBMZMS5DWujNMKY2g6h
         hs5w==
X-Forwarded-Encrypted: i=1; AJvYcCVbRm/n1vNnYR4o4Xwvwq+5k8CUY2b+eXAwJfAE8cPn+Z7BJQ5hurmTqdKnNa1TGt/0Ul6JWg8erz4K@vger.kernel.org
X-Gm-Message-State: AOJu0Yx486Ta37xWHXO09pNbD7KbcxLVTOpwSR2GsoD8dlld8IOl0ssY
	GiIQnTz61XmPTAp8uj1db4eMepVSN/fydUh32CbfDUFyPIQ3uAJMSiX0TmXBFXPxwnAb38e0+6U
	q
X-Gm-Gg: ASbGncs9/RmyvSrKruNgro3zxpc4EmLZvLF6ChNy4NlfU6jsjglahxb0f82mPPuZgfW
	GenXCbGnqnVG5DHp0yt4F7LMZQC3a0nuGnBDG/xAOHfyQB2IeYJQFeU1dGgIp8C2Wy8sfoP9bcs
	rvYM+qosL62Hs9UWuv5jdlK8zD8P6eZJqBpiJMK03JMqmYCGI0asTKf1z3wbsl78xuq46IKtQdJ
	yVpQw7+GlCNWv/0NUR1XpJDeDKpvR7fbk5w1A8dvWPIwCmxt1cIo+Ev8VL1Z/sZgiM/bQncU3nO
	AzAqWw3D+sX08/UAWZdGt40rh2jG
X-Google-Smtp-Source: AGHT+IH6R+T8ebyQf9rdcdZUVI71kGpu7PU2ttTVFiC7irX7+e4STlfb0dCzUvPnkZg6IStO3UaJqg==
X-Received: by 2002:a05:6a00:2a08:b0:725:d64c:f122 with SMTP id d2e1a72fcca58-72fc0886e88mr3314768b3a.2.1738035233068;
        Mon, 27 Jan 2025 19:33:53 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a6b2ecdsm8018925b3a.45.2025.01.27.19.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 19:33:52 -0800 (PST)
Date: Tue, 28 Jan 2025 09:03:50 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the cpufreq-arm tree
Message-ID: <20250128033350.ijrmlc6wok4ynsqp@vireshk-i7>
References: <20250128115153.4dff400b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128115153.4dff400b@canb.auug.org.au>

On 28-01-25, 11:51, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the pm tree as a different commit (but
> the same patch):
> 
>   236b227e929e ("cpufreq: s3c64xx: Fix compilation warning")
> 
> This is commit
> 
>   43855ac61483 ("cpufreq: s3c64xx: Fix compilation warning")
> 
> in the pm tree.

Dropped from my tree.

-- 
viresh

