Return-Path: <linux-next+bounces-7464-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D96B00E50
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 00:00:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 499B57BAE4C
	for <lists+linux-next@lfdr.de>; Thu, 10 Jul 2025 21:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D70828C036;
	Thu, 10 Jul 2025 22:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kz8a95eX"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7CE293B46;
	Thu, 10 Jul 2025 22:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752184807; cv=none; b=if8G5CYmNb+TuZVuauC9rSBjgL/J8zLN5ZK9T8tsYBhbD8xR/7F0B3roGL4wI6cMYRM5IASnp6zZoPWX18WVFVmRuvW/efQUONV+RDehW/LBtrhjANGLJBwT8sA+S8pYfPwf66FZ14aHNMZooMiA8eFoQJdU6WdMmvzPd355Ovs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752184807; c=relaxed/simple;
	bh=Lc891ix4xvedwTi78TFh6r6//wDoNaZgeUBTsm8u/pI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WkEF2bh1eXuIW83DZkZerdrT7v11nF3CMX+48j63OSe+1mKcikqFiGVn4Pyu1ct2KDD8IQrROIEbKw6erHnaf5ihYjnJFDg2uW5uebnibuhsKq7YCa1RMqJCYhp18km71uMn39LAvU4Y/DTS/2jR8Ktg+3xz6quUBsRDw9ZNv4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kz8a95eX; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752184805; x=1783720805;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Lc891ix4xvedwTi78TFh6r6//wDoNaZgeUBTsm8u/pI=;
  b=Kz8a95eX81F4D+FfyQyucD1QV7q1vY3tNbrjBYIrsE5CuFthqwNkCT1t
   uu1SqvA7PJh6waJSL436aavJjycNAflACQ0AP3gQWqqBSjsxbtsfIZBYa
   mAw46wh+3RLlB1N61vj0ML5Hjt04sFJ2Hga4qHvPx5czFR5mZLRPKXnaW
   x3wEhcaILtSbiXV1vwT8STm59PafB5dQnxsZTWVbnlIrYcAbFMXrLU+Bf
   hpnZOg0FRIX+sM7OzD8tca13fqoIZ0JLS+vPCjN04eJB9MavFI1wMoPoz
   4aOhun42MReNoIhzOnKWpoZUSHPW0+35rdtbQmz0FYEZQ5Z8vbLLJZSco
   w==;
X-CSE-ConnectionGUID: alBWpfOUQYq+T7t05GmvMA==
X-CSE-MsgGUID: vs4NtLdOSYCSqcl5jtvhuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54633240"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; 
   d="scan'208";a="54633240"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 15:00:05 -0700
X-CSE-ConnectionGUID: 4yL8EGaLQr2gZdTTaeGi7A==
X-CSE-MsgGUID: gyvHSjQjTISkbx8Z7BDXvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; 
   d="scan'208";a="156691429"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 15:00:02 -0700
Date: Fri, 11 Jul 2025 00:59:58 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	airlied@gmail.com, simona@ffwll.ch,
	Krzysztof Karas <krzysztof.karas@intel.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com
Subject: Re: [PATCH v4 1/3] drm/doc: Fix title underline for "Task
 information"
Message-ID: <aHA33ispT8V6GUhn@black.fi.intel.com>
References: <20250704190724.1159416-1-andrealmeid@igalia.com>
 <08de556b-e63c-420e-8ab4-c03712be9709@igalia.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <08de556b-e63c-420e-8ab4-c03712be9709@igalia.com>

On Thu, Jul 10, 2025 at 06:27:45PM -0300, André Almeida wrote:
> Em 04/07/2025 16:07, André Almeida escreveu:
> > Fix the following warning:
> > 
> > Documentation/gpu/drm-uapi.rst:450: WARNING: Title underline too short.
> > 
> > Task information
> > --------------- [docutils]
> > 
> 
> This series is now merged at drm-misc-next, thanks!

Shouldn't this be drm-misc-fixes?

Also, this series continues to not land in my inbox. This is why I use raw
emails in my sendmail automation.

Raag

