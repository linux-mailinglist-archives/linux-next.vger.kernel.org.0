Return-Path: <linux-next+bounces-2928-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1492792D551
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 17:49:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFED81F22BC9
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 15:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EB66194AD3;
	Wed, 10 Jul 2024 15:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dc8dhaBf"
X-Original-To: linux-next@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6902518FA39
	for <linux-next@vger.kernel.org>; Wed, 10 Jul 2024 15:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720626531; cv=none; b=DEJkyuMz4v8xq9vJeXKf2itwVKhxkeqWA2y5+8JbiNmcforyxh6hW1/3YsrGUWLmqxv8AxcGVrcr/cxmfSYXdbU/QvHY1HUZpgrKm4qf9/tOiovDoPvvrD2PYhybJv57MxSDlQrcac9Nt2LMpqAnHYjgAes9+hJLl/T/OHzvhrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720626531; c=relaxed/simple;
	bh=c2n4VVQzipIfpzPrWV9F7UOv/MDw3Ud7EfBOXdrzOXY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=uWFnKuwHgVlpiKdZvmTLc+NLY6oPcWudnRZ0hzz2x2BMP+RGVqQu9azxZ+YdcflYzQu40EnOlCG2I4ESvMWl78u/le7700ROa3RfVvF8hIu0htEjxDiS8ZpuJBm2TTbMqr909flFSrNhYZDakTmgQuHHjaxqZPP4FdMGBgT8hLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dc8dhaBf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720626528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Wt5Vyb1ibASftYVrpnZoVWe5UGkYzs3XwGwbVoV/Z3k=;
	b=dc8dhaBfL46YftgxyjF+U/7HEnBIJWXjPXHVK3ucE+BeQb8+DfoEGSoCmqJICa+OIqcnJ+
	mr4UXfoZDqhpZzXouQ7AWGn7leGmsX1WuqMNLkmyFVr/I6tn9nuZiZWuQlolC0jzraGXw5
	NjWNqUnWSqSt/WbkIBNY1XJCNWaSeCM=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-580-j-EUm2aEPciHBObPAFXcIw-1; Wed,
 10 Jul 2024 11:48:43 -0400
X-MC-Unique: j-EUm2aEPciHBObPAFXcIw-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 578A51954B0C;
	Wed, 10 Jul 2024 15:48:41 +0000 (UTC)
Received: from file1-rdu.file-001.prod.rdu2.dc.redhat.com (unknown [10.11.5.21])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2DBE21955F40;
	Wed, 10 Jul 2024 15:48:40 +0000 (UTC)
Received: by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix, from userid 12668)
	id 7B8E530C1C1C; Wed, 10 Jul 2024 15:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix) with ESMTP id 772C141970;
	Wed, 10 Jul 2024 17:48:39 +0200 (CEST)
Date: Wed, 10 Jul 2024 17:48:39 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
cc: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the device-mapper
 tree
In-Reply-To: <20240710082824.30c8161d@canb.auug.org.au>
Message-ID: <622b892-d792-382c-46f8-fe5cfdba4df1@redhat.com>
References: <20240709185733.4aac356a@canb.auug.org.au> <49ab648e-3c89-d4d-f2f7-3c1e2aa2cab@redhat.com> <20240710082824.30c8161d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17



On Wed, 10 Jul 2024, Stephen Rothwell wrote:

> Hi Mikulas,
> 
> On Tue, 9 Jul 2024 11:56:27 +0200 (CEST) Mikulas Patocka <mpatocka@redhat.com> wrote:
> >
> > On Tue, 9 Jul 2024, Stephen Rothwell wrote:
> > 
> > > After merging the device-mapper tree, today's linux-next build (htmldocs)
> > > produced this warning:
> > > 
> > > Documentation/admin-guide/device-mapper/dm-crypt.rst:168: ERROR: Unexpected indentation.
> > > 
> > > Introduced by commit
> > > 
> > >   04a1020ad350 ("dm-crypt: limit the size of encryption requests")
> > 
> > How should it be fixed? Delete the '-' character? Or some other change?
> 
> Looking a few lines above shows indented paragraphs without the '-'
> which seems to work.

I hopefully fixed that.

Mikulas


