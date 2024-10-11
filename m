Return-Path: <linux-next+bounces-4235-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA0C999CC2
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2024 08:34:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B94251F2281A
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2024 06:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C52601F1309;
	Fri, 11 Oct 2024 06:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jisbFQF2"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4581CCB3A;
	Fri, 11 Oct 2024 06:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728628479; cv=none; b=FY65uVHMb0gpKcF4p20D6toJL4ogh9PaBKIDQowrfS8wU9sFeUmqtt58DR14JwHEoPEF/bG7f2WkG556E3FGOK797Nc7jBu+a9c/wm7m317wAYDN84XJiDnANghaPtejJUEXBhQFI3NPdwIolG1qKQcick260QPaA/MGg4vXB7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728628479; c=relaxed/simple;
	bh=FEAvGKhQ4zqHFICD+AMuBA5qP7NXObr933U618inJnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vDsxVHs47OqHiRRRnzfETLcf2UkYqmOTOP17XX70dNqmpI8yODCPqZ/yRlw4icmatOWW8ji5xSjuB6E8pwNRexHttu5EEx4pgY20OxATm92uHtgHy7jaQKJp0N6skGcN0f5RatUV+b8i3roZhrcvT86u3lt8WaXa+Y1lcvfflxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jisbFQF2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCAFEC4CEC3;
	Fri, 11 Oct 2024 06:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728628479;
	bh=FEAvGKhQ4zqHFICD+AMuBA5qP7NXObr933U618inJnE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jisbFQF259AC5RziZDEkckO/MK8T8sWGs/uKXLA4w7zIYwE0gKlGwcp5Szjl0q91e
	 rhWv2eL0hMX3d3D2v/XNSiF5Qqt5K+wYAGqEQy3v/pxXcjClnVJ+n9xzS4WUtUPZ9s
	 mxTzUh1zVhbqGFXpdyiEMaz4Fi+SptDjiqKW9veFK35HO8cbVTnz5YNMRYmlRVsQxn
	 QjyjBDwoYjhhQtXJHkF4j6oInATuO9wdhTnlT068Oda6AcgZv0mDLzAFPQgeyICZP7
	 AmEhGvta83xdDWUoRvSVW+dUWoAPP7xKSxOIGDzd7zwcAHSfa/XIYEPwygycNtt6DE
	 WcD18d7l9pEGQ==
Date: Thu, 10 Oct 2024 23:34:37 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Ian Rogers <irogers@google.com>,
	LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org
Subject: Re: [PATCH] perf tools: Fix build failures on ppc64le
Message-ID: <ZwjG_ZpqV4h3HifQ@google.com>
References: <20241011102330.02bece12@canb.auug.org.au>
 <20241010235743.1356168-1-namhyung@kernel.org>
 <20241011114858.61ff252b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241011114858.61ff252b@canb.auug.org.au>

On Fri, Oct 11, 2024 at 11:48:58AM +1100, Stephen Rothwell wrote:
> Hi Namhyung,
> 
> On Thu, 10 Oct 2024 16:57:43 -0700 Namhyung Kim <namhyung@kernel.org> wrote:
> >
> > Hi Stephen, can you please test if this patch fixes it?
> 
> Sorry, I still get the same errors.

Ok, thanks for the test.  I'll drop the series and rebase the branch.

Thanks,
Namhyung


