Return-Path: <linux-next+bounces-3425-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 395B295F5FA
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2024 18:05:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B3031C21DF7
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2024 16:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 997EF1946B9;
	Mon, 26 Aug 2024 16:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pankajraghav.com header.i=@pankajraghav.com header.b="fdYHzePq"
X-Original-To: linux-next@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD2F1946C7;
	Mon, 26 Aug 2024 16:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724688045; cv=none; b=U2llZVIY7MLjL0JrOAchyq+1SiQ5QUPS96kGaVtA0Tn1VHnlP5RA69SGBTLASwYf/U9RlW39HZouFFmOJhp01v8irDvWWfmD7fBFqtj5A5/2SZfH3422sZrqBsmWwz5nFPauai5O4khkasTHiErbvp5kmwptqp5z/41cSMNMy00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724688045; c=relaxed/simple;
	bh=pQmu4ElY5V1dBele1C+TuAB66tczegHDgOzR4cWRx7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N4Slww6QougvuT6sGbtBbtekdesxfjDo3Zife3nxSm9N1IatXBRCorlur1m8YpV5CioPc9NR8IJLC8wZHTfPBCzQRTe50hufu0dyQSUU0+Sv54imiG/M/I/XOTJ6iNU4+YFHQXiOc78Mc2+ziA57t5fPlMkipGpWZYnV06SdgcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pankajraghav.com; spf=pass smtp.mailfrom=pankajraghav.com; dkim=pass (2048-bit key) header.d=pankajraghav.com header.i=@pankajraghav.com header.b=fdYHzePq; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pankajraghav.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pankajraghav.com
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4WswPg6P4Wz9t3B;
	Mon, 26 Aug 2024 18:00:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pankajraghav.com;
	s=MBO0001; t=1724688039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hs2FEQs7SvZY85QmycsK0mSJCJzhh58UBQngjClE5W0=;
	b=fdYHzePqJeywx4IDDR6RgTkGCAMO+agf5joH1Mq00jn9CUA9nvP9M7MgTS7gtgcnvub8UQ
	MtmAslltDamgS72YeTgNiNnDGZS8Oid3X9w20CXHqXcP4tDaH6FktZd6dDgoiyqILqg2C2
	IZwFDIXveNo1ZnIFUBt1ugrEu+f2N9swUxaxAs2wSwmUp6ZrrEMqupRotZ9HA9iiMZp5bo
	53AAQLn1I/FtXDrop0wWNA5WddJf1LDrtI/O+iQqQugZuviLcWKGGjswWQ3tJmYiAf9Ugi
	sF8Lb6nv1C8CQJILDgKtjT4Q1MiuUwtkGburZRrDXtX1wYz3KrDWIjB/5ondZw==
Date: Mon, 26 Aug 2024 16:00:37 +0000
From: "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Brauner <brauner@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Pankaj Raghav <p.raghav@samsung.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	kernel@pankajraghav.com
Subject: Re: linux-next: build warning after merge of the vfs-brauner tree
Message-ID: <20240826160037.zbo6lishqswibu3k@quentin>
References: <20240826160109.12d97220@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826160109.12d97220@canb.auug.org.au>
X-Rspamd-Queue-Id: 4WswPg6P4Wz9t3B

On Mon, Aug 26, 2024 at 04:01:09PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the vfs-brauner tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> include/linux/pagemap.h:480: warning: Function parameter or struct member 'index' not described in 'mapping_align_index'
> 
> Introduced by commit
> 
>   c104d25f8c49 ("filemap: allocate mapping_min_order folios in the page cache")

Oops. That should be a trivial patch. I will send this fix along with
the set_memory_ro() issue in powerpc once that is resolved.

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 55b254d951da7..6c0dde447c980 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -470,6 +470,7 @@ mapping_min_folio_nrpages(struct address_space *mapping)
 /**
  * mapping_align_index() - Align index for this mapping.
  * @mapping: The address_space.
+ * @index: The page index.
  *
  * The index of a folio must be naturally aligned.  If you are adding a
  * new folio to the page cache and need to know what index to give it,
> 
> -- 
> Cheers,
> Stephen Rothwell



-- 
Pankaj Raghav

