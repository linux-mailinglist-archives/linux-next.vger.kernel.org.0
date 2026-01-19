Return-Path: <linux-next+bounces-9717-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DD33DD3B5FF
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 19:43:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9663B3046990
	for <lists+linux-next@lfdr.de>; Mon, 19 Jan 2026 18:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D62A389462;
	Mon, 19 Jan 2026 18:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D4wMe1n8"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE92D2ECEA3;
	Mon, 19 Jan 2026 18:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768848178; cv=none; b=Aj02x71CkLUbs+XwfHd2k7/U5PLBgYF6j5fXR8I37JT931PJRaQi+ur4eeu0t0158fhRQ8PuGSWWWTfaNKSkIhwax/hwimLH3tLnKCVPQW9kjKdlZq3aaUrsIoSWaAFmlHtRBDFZ0FzcrAWkMJR0+V+gUHs5AM3E9EZECO7wW6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768848178; c=relaxed/simple;
	bh=3jKwS+UK/IExZ5ahYTmjIMX5flLX0lrqte5UkBGBkCg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rN9g09+UwCqcFyky/iyWJOCQ19guI9F1UOw6RlnM7n67eaNhrcTbs/Wy561dY/T99bTWBr3/H1Ynzq/hKsRVZsgkL9bJJAjWxbF194GP7gl9bSHaauS5HoOEw+MJNcmHpoSmONusWmrGYVQQDjU1raKtPdcOdNcPdpGE1WHAbnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D4wMe1n8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81E2FC116C6;
	Mon, 19 Jan 2026 18:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768848178;
	bh=3jKwS+UK/IExZ5ahYTmjIMX5flLX0lrqte5UkBGBkCg=;
	h=Date:From:To:Cc:Subject:From;
	b=D4wMe1n8ADUdCBHJel7U7Aw/aSA2w2O6Rk1ZokfH5R5sWshVPFX28nyVz0wcCUVtM
	 VmptCpB5bmt8RVgM69R0OjK/F4WH+4425SNmM6oGjZx/hIwNkvnoOUt1e/j9fGZdLa
	 c+XwDjG8GMCljGt7FDJExbDXFxi+xkjYA7+2scprU7xXpnSuk6BRphABae7U4VifUK
	 xraZ9o57qWRgdqg0gVrZPhemlpn3IfHH+VQcru/qWD0Hi4vv5kI9lRHV0aZQXHUPg+
	 28avs22YQS78qKvPONkipT+pynQ86/8px3wNWt/csQugHcbJIPhVbR7U5V3yO4WveV
	 /lBnG8GaVBE7Q==
Date: Mon, 19 Jan 2026 18:42:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Joerg Roedel <joro@8bytes.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the iommu tree
Message-ID: <aW57LhM6g2KnrV_w@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the iommu tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/drivers/iommu/amd/iommufd.c: In function 'amd_iommufd_viommu_destroy':
/tmp/next/build/drivers/iommu/amd/iommufd.c:62:27: error: unused variable 'iommu' [-Werror=unused-variable]
   62 |         struct amd_iommu *iommu = container_of(viommu->iommu_dev, struct amd_iommu, iommu);
      |                           ^~~~~
cc1: all warnings being treated as errors

Caused by commit

   757d2b1fdf5b7 (iommu/amd: Introduce gDomID-to-hDomID Mapping and handle parent domain invalidation)

I used the version from 20260116 instead.

