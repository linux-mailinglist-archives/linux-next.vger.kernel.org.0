Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8631B175C06
	for <lists+linux-next@lfdr.de>; Mon,  2 Mar 2020 14:47:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726872AbgCBNq7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Mar 2020 08:46:59 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44922 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726805AbgCBNq6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Mar 2020 08:46:58 -0500
Received: by mail-wr1-f66.google.com with SMTP id n7so4755026wrt.11;
        Mon, 02 Mar 2020 05:46:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EsNI7T8fx9/zJXjOHaygab/3xTyRqQbHWTw10t+dBzA=;
        b=jZZiwCACFxH1dWhm1nAaqz/yKHB7KknhPpSizcZguUpTair8VZuvNld6PdLyqo9uMH
         VC5PFVLz3nYJT4Af2BJA7gam3vS3rFpLSJvFumgWCJy0RxA2KFHjUh+M4140Sk+YH64O
         HEqZr7E57HSROrw4ZfnvRYqKu84pmKSc2O9s1Dzl0XclO3AibWqkYEAtg+Jn4b4ckwbY
         ulNGxRXlDIcR/vfLaY37y10GGYXPMKc3sgcDn8v8CHEvqdsHWCq1jJuuNd6v7Fsn0OYA
         18sK8C4I97WRv3mx9TnwjGdMix8FOTp20C//OlgOhonvNichSIjJ4x8THVi/KVTtYgdM
         3nzw==
X-Gm-Message-State: ANhLgQ1IeTfJ6SSFkme+reMSANyEb8sR7JWeKUo5aEbJswPpIjm71zyY
        QGya1Ax74E7stqsbbMkxRq4FhUYF
X-Google-Smtp-Source: ADFU+vsk/lNuhHwpxpNwBVIC3coW7NDluM9AGC/3y86Bm7OKnhdIXSzQoDViXc7JHCsYkjCUFwi+xQ==
X-Received: by 2002:a5d:5643:: with SMTP id j3mr9174610wrw.337.1583156816652;
        Mon, 02 Mar 2020 05:46:56 -0800 (PST)
Received: from localhost (prg-ext-pat.suse.com. [213.151.95.130])
        by smtp.gmail.com with ESMTPSA id z2sm23174843wrq.95.2020.03.02.05.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2020 05:46:55 -0800 (PST)
Date:   Mon, 2 Mar 2020 14:46:55 +0100
From:   Michal Hocko <mhocko@kernel.org>
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     Claudio Imbrenda <imbrenda@linux.ibm.com>,
        linux-next@vger.kernel.org, akpm@linux-foundation.org,
        borntraeger@de.ibm.com, david@redhat.com, aarcange@redhat.com,
        linux-mm@kvack.org, frankja@linux.ibm.com, sfr@canb.auug.org.au,
        linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
        Jan Kara <jack@suse.cz>,
        "Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: [RFC v1 1/2] mm/gup: fixup for 9947ea2c1e608e32 "mm/gup: track
 FOLL_PIN pages"
Message-ID: <20200302134655.GL4380@dhcp22.suse.cz>
References: <20200228154322.329228-1-imbrenda@linux.ibm.com>
 <20200228154322.329228-3-imbrenda@linux.ibm.com>
 <c98038da-cf52-27f5-1aed-b69287a5dec0@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c98038da-cf52-27f5-1aed-b69287a5dec0@nvidia.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri 28-02-20 15:08:35, John Hubbard wrote:
[...]
> (Aside: I'm using the linux-next commit hash. How does one get the correct hash before
> it goes to mainline? I guess maintainer scripts fix all those up?)

There is no such maging going on AFAIK. Please just do not use sha1 from
linux-next unless it is really clear that those are not going to change.
So essentially everything from mmotm is out of question.
-- 
Michal Hocko
SUSE Labs
