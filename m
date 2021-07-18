Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FACC3CCB71
	for <lists+linux-next@lfdr.de>; Mon, 19 Jul 2021 00:48:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233379AbhGRWvQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 18 Jul 2021 18:51:16 -0400
Received: from mail-pl1-f181.google.com ([209.85.214.181]:42690 "EHLO
        mail-pl1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231846AbhGRWvQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 18 Jul 2021 18:51:16 -0400
Received: by mail-pl1-f181.google.com with SMTP id v14so8590077plg.9;
        Sun, 18 Jul 2021 15:48:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pzlrHZ05KMXoN+FW5nS9GCk+7BNweOh85d73iVbocLw=;
        b=USDA4gxvg2QcX7H28ZMVsVISiAaQE21E83kzkE9vvHNOq1oacnFomB+YQwNqTZlu8T
         wW2jdebXLqBnpWfKzEQE8Wd264EXMEJwvcLerOU+uvtwEWypOEgPmVnepguTziHw3TMB
         3lHb3cKHqdP6l1Asy5Gi0LuP9SeeeKJjeVzfAxQhFUPcFJVRdqbMHM4cmO8jF774kdNm
         nAHGmurpPq5J5PU3VUODNy6pOURLTY36C3L9YISTuCLezogRylhfD9+rD7+ZLR5oStfD
         xooHNqFFPCvn2HJIhFk975GVEpYekpk1nLGHh7nGpw2PLZiwvHaVAkrDQynFV34NnpPc
         bOfg==
X-Gm-Message-State: AOAM530ySG8tFY7lFhPV59BKZOVw2iOUTd7kno+aEBJhyG9fMkj2sdM6
        Dfw1lMuvYqkR20OJewIMV0w=
X-Google-Smtp-Source: ABdhPJyYJYZ0g1g+LvbNhKG9EqJwnRDvbqWrUe2tpIcNdiUOcjsywRlQZPYRbn3815a0+4BmwRNB0g==
X-Received: by 2002:a17:90a:4417:: with SMTP id s23mr27028229pjg.228.1626648497289;
        Sun, 18 Jul 2021 15:48:17 -0700 (PDT)
Received: from localhost ([2601:647:5b00:6f70:be34:681b:b1e9:776f])
        by smtp.gmail.com with ESMTPSA id v7sm8200257pjk.37.2021.07.18.15.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jul 2021 15:48:16 -0700 (PDT)
Date:   Sun, 18 Jul 2021 15:48:15 -0700
From:   Moritz Fischer <mdf@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Moritz Fischer <mdf@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the fpga tree
Message-ID: <YPSvr1r51Y2MkSZc@epycbox.lan>
References: <20210719081926.5ea11131@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210719081926.5ea11131@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Mon, Jul 19, 2021 at 08:19:26AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   6c17b7ff1d11 ("fpga: zynqmp-fpga: Address warning about unused variable")
> 
> Fixes tag
> 
>   Fixes: c09f7471127e ("fpga manager: Adding FPGA Manager support for
> 
> has these problem(s):
> 
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes
> 
> Please do not split Fixes tags over more than one line.
> 
> -- 
> Cheers,
> Stephen Rothwell

D'oh. Do people fix these things generally with a rebase?

- Moritz
