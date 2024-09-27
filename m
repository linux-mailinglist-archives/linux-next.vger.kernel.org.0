Return-Path: <linux-next+bounces-3994-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE41988265
	for <lists+linux-next@lfdr.de>; Fri, 27 Sep 2024 12:25:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CD22283608
	for <lists+linux-next@lfdr.de>; Fri, 27 Sep 2024 10:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C4431BBBD3;
	Fri, 27 Sep 2024 10:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="YbEi/3rX"
X-Original-To: linux-next@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4D519FA66;
	Fri, 27 Sep 2024 10:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727432743; cv=none; b=QAD0qPvbj3Lowc/v92M8Q7jA1HyK0B3LrOrqrp5nuznQZ0XZPuDN30FDgCpppgzdC5m6tcrWruBMhki3aP3vdtbhLbT+srgppFv1vmzc9YNrYVpJsTtLuu37+iDixTQVSFD6O5kiGvF7dzaN9p3SODZTXx2Xxiri61iRPn2mU38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727432743; c=relaxed/simple;
	bh=deoRTQsc/jmO/3PI13iUFKJ8VRt2zP00FMOAs9pNWAE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HvREbVvvPrlg5MnKuGWGxjxlNXQAwbuuQqU0ypMgOciF3TOq54AHWDRN8kv69mw5wxGKpgPsAAUrPuILcElCKPB8KJ0Vq8+O0tOUqxKVA/DEYnY2BbgEp9qspJfpQad8hYLZAif1agmZVv4goDJN9npohbDDRiuU4B915bFszV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=YbEi/3rX; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net AFC1941898
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1727432734; bh=6WPhCE4x2dsw0rer9LX+9vHWkhowueVam5DumtgG7lY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YbEi/3rX+RywDDrysdyrvbSch6CwlXQ4hY3xMIIIp9LlRu9wdfH/sc5yAzow48HYf
	 uhgX4RWuDxkObUz9taQZGpP5WcV9XKZrIt5q2DKnCMF5qeDXfD4+nh3CwNdwyvgXK3
	 r68C+i0lSYCTQwJRZ+SdPL7tEInB9TB2vPetw6wabl9TrDVTEgcSih48CR02CXjBV0
	 FPLFSbmHWeCA18OIYSj5QC/FH68E85EZOT9hyiYNBMm/OeVOxRmP8SqA3xqtjWJsRe
	 ASUKlKcbAN7s1unZlwAuDmVVt/U9judEDDjxnG0GKqIVfUZLO0jVNoGxWfrwCBU1XT
	 Uc4BSb+au0iAQ==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id AFC1941898;
	Fri, 27 Sep 2024 10:25:27 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Steven Rostedt <rostedt@goodmis.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, linux-doc@vger.kernel.org
Subject: Re: linux-next: build warning after merge of the ftrace tree
In-Reply-To: <20240926091452.4be87000@rorschach.local.home>
References: <20240919150513.067dd727@canb.auug.org.au>
 <20240926091452.4be87000@rorschach.local.home>
Date: Fri, 27 Sep 2024 04:24:52 -0600
Message-ID: <87a5fte6mj.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Steven Rostedt <rostedt@goodmis.org> writes:

> On Thu, 19 Sep 2024 15:05:13 +1000
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
>> Hi all,
>> 
>> After merging the ftrace tree, today's linux-next build (htmldocs)
>> produced this warning:
>> 
>> Documentation/trace/debugging.rst: WARNING: document isn't included in any toctree
>> 
>> Introduced by commit
>> 
>>   2fcd5aff92aa ("tracing/Documentation: Start a document on how to debug with tracing")
>> 
>
> Thanks for reporting this Stephen, but I don't know how to fix it.
>
> Jon?

Add a line to Documentation/trace/index.rst in the appropriate spot
referencing the new file.

jon

