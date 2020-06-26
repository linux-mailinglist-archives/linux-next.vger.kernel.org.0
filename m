Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6EFD20B9C1
	for <lists+linux-next@lfdr.de>; Fri, 26 Jun 2020 22:02:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725880AbgFZUC4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 26 Jun 2020 16:02:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbgFZUC4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 26 Jun 2020 16:02:56 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DBF9C03E979
        for <linux-next@vger.kernel.org>; Fri, 26 Jun 2020 13:02:56 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d10so4643198pls.5
        for <linux-next@vger.kernel.org>; Fri, 26 Jun 2020 13:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=HuJILZmXLURp/yn0oSueJPx2COyMJVkAtdj3c8sCa2A=;
        b=Oh/RiiCDnbp34CVdzAILpR378u4/AQdViDFg7C7oW5dt1jDbyEeAjP90KAvvKhIr97
         KwI71vJclhWb7o4mSkhCh2NOFbTtfJgpS+vox3O7+FvJkCsMl4urremmWYspWh28A0+Z
         sV5HTCY7Nn86R70arsfIYUzY6CqZUi43QquRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=HuJILZmXLURp/yn0oSueJPx2COyMJVkAtdj3c8sCa2A=;
        b=mzMHHkV+T3URp0kjcT65ElkyjjKEY3q411PUiotoAh3BlVmCmSTcbO9fkXbJqSYJ8i
         n7H0Xzc6knEfik0RZgiU56VToUzrwxYbK1+SheDfndS32Sj4W6r6nC6V8ZNjT5qhpTNT
         NFCi3PSi4vtdvaajdrgzqc2u+pKlKRtc+/TMLCeFq/ORMbNZbmvmJGyHYg6IEmzb73Q7
         lMov1VVRjKG1h9Jpc7pNoFUndQld4PQHW9NbrUN+nMlSE0OHKDL5YVSsDNkk9T2kbect
         QCoXSVfTWFfBbhwp9eDCS/5zHHqlf0YdmZsUN0iXSLQtJCxQQShYExZ7wIc/47ApSeNn
         MwoQ==
X-Gm-Message-State: AOAM530hg+pZ1S5Am51jdTKmwAjpLY3gp8eRqx5jak+oesBYVhWLK03Q
        LqVe7Axl3UgslgHIARnV2DPN7w==
X-Google-Smtp-Source: ABdhPJw11xKQt6MwLhidUJ9gydREFfdw80oPEr/XN3WYlxPPeC/ryrLDoithYT16cWqdMGMaKZA/Bw==
X-Received: by 2002:a17:90a:8a8e:: with SMTP id x14mr4810785pjn.169.1593201776002;
        Fri, 26 Jun 2020 13:02:56 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b14sm8925970pfb.186.2020.06.26.13.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 13:02:55 -0700 (PDT)
Date:   Fri, 26 Jun 2020 13:02:54 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     akpm@linux-foundation.org, broonie@kernel.org, mhocko@suse.cz,
        sfr@canb.auug.org.au, linux-next@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, mm-commits@vger.kernel.org
Subject: Re: mmotm 2020-06-25-20-36 uploaded (mm/slab.c)
Message-ID: <202006261302.13BB6AB703@keescook>
References: <20200626033744.URfGO%akpm@linux-foundation.org>
 <7ff248c7-d447-340c-a8e2-8c02972aca70@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7ff248c7-d447-340c-a8e2-8c02972aca70@infradead.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jun 26, 2020 at 09:28:36AM -0700, Randy Dunlap wrote:
> On 6/25/20 8:37 PM, akpm@linux-foundation.org wrote:
> > The mm-of-the-moment snapshot 2020-06-25-20-36 has been uploaded to
> > 
> >    http://www.ozlabs.org/~akpm/mmotm/
> > 
> > mmotm-readme.txt says
> > 
> > README for mm-of-the-moment:
> > 
> > http://www.ozlabs.org/~akpm/mmotm/
> > 
> > This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
> > more than once a week.
> 
> 
> when CONFIG_NUMA is not set/enabled:
> 
> ../mm/slab.c: In function ‘___cache_free’:
> ../mm/slab.c:3471:2: error: implicit declaration of function ‘__free_one’; did you mean ‘__free_page’? [-Werror=implicit-function-declaration]
>   __free_one(ac, objp);
>   ^~~~~~~~~~

Eek! Thanks for catching that. I will send a fix patch.

-- 
Kees Cook
