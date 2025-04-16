Return-Path: <linux-next+bounces-6272-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 753EAA90DE0
	for <lists+linux-next@lfdr.de>; Wed, 16 Apr 2025 23:40:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB5B6190319E
	for <lists+linux-next@lfdr.de>; Wed, 16 Apr 2025 21:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16BA4233120;
	Wed, 16 Apr 2025 21:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QfgBui5L"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BA0197A8A;
	Wed, 16 Apr 2025 21:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744839636; cv=none; b=YPj7KsuYNLi6EgIQIlxyt9oooCPc8JrBaebq/cVHKpYz8F+lmS11wNLkbtXvINWPaK4SRo7uN6f8m+v+GzB3FgloyseYCQwP+E6JqV4Rhv3bm5xjoim0n725ulXf7bkt/z/1bSGKYjU9tEPQBkkLtHrQq0rs+7waGiyV1kqj9n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744839636; c=relaxed/simple;
	bh=vwJK5Cxk+h8er59kYpCH8AVldBpt6RrGLPjteQWPRJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GPFZMov1HIN9pxLivpdaU2DTssLAtVfu2oJBs10MeQ1l4wA0AX7DhYs5XYDykcS+cicWold53xFMUiw/OMzkL1ERl6A8me6cWL6lJlzMnVkmYbaNPIBPlgL+6HW/PwYdKVnr4XBZ+jI5vUBBj36fdVks0hWpbLVJpD5Nl0CyqqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=QfgBui5L; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JW71Yrm63KAFDznLeuHzMNkNic4k+DAdb4uxGi95x7o=; b=QfgBui5Lt/jYbwOhChwnQ3eyuS
	jPBPseu++95pDBQtGD7MWZtl5vghAroyGSsVmRVO+WRtQY3vz1dUlSHnLi2V4rnBEk0Y91GCnE0Np
	8haDT6AtAzM1ciBi9R/umilQcnJYrhiPAYuI0IjkhbYoYySLcBu6jDyvXIpcWWQNXoxGlR0SolAlo
	d95jLXEt9kp5glBOe1vyzVh9muf5oKcCvTB3HeEHSJJwR+Lgt1ROfC97VTe7v+v7nTPx28sn3ar5q
	pZcIUVkVo+shd4yMl/JyiCLcGfbSplwAmejt9YSFhIlZoRAUYnd6G7rU0czxIxjZ5pgDbSLB2G30m
	rekY60Aw==;
Received: from [50.39.124.201] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u5AUZ-0000000ABCe-19tR;
	Wed, 16 Apr 2025 21:40:26 +0000
Message-ID: <0e5ac6ff-12ea-4a95-9849-b5e102de4f97@infradead.org>
Date: Wed, 16 Apr 2025 14:40:19 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Apr 16 (drivers/gpu/drm/xe/xe_vsec.o)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250416162556.3191a75e@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250416162556.3191a75e@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/15/25 11:25 PM, Stephen Rothwell wrote:
> Hi all,
> 
> News: there will be no linux-next releases this coming Friday or Monday
> or next Friday.
> 
> Changes since 20250415:
> 

on x86_64:

ld: drivers/gpu/drm/xe/xe_vsec.o: in function `xe_vsec_init':
xe_vsec.c:(.text+0x21a): undefined reference to `intel_vsec_register'


(Yes, this is a known issue so this report is just a reminder since it has
been some time since the other reports.)


-- 
~Randy


