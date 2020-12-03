Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 550122CD2BA
	for <lists+linux-next@lfdr.de>; Thu,  3 Dec 2020 10:40:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730133AbgLCJkM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Dec 2020 04:40:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:58376 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730131AbgLCJkL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 3 Dec 2020 04:40:11 -0500
Date:   Thu, 3 Dec 2020 11:39:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1606988371;
        bh=naiZqN/dkrNmjqIaGf5Zs+U3tdULa/kjGcnzeJW5YYQ=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=uDmarng7rvlDp3UOHm68n7xIP6Ww/OusgaKR83n4i+nvIJ63r320WJntm7xxQNQIM
         T0qR/9I1RoZUIaZCEQ5KfXjPurvZYYpo7Zg/9BMbll4Uv4jj55gTjBYukvuAA1uUx3
         aEPglSRZUVAmIKSTlFMGgQIIsn2zQnY9I1UIQqoTqEMTyppVl0EllbilTO59oiBUYU
         vgM7NkYBCqsM7lrtTFdh0efQ0H1P7eG6rXUllOtwE6JxoP8SuB4fhR4iW+aDrty2+z
         BnTOK4zz0bfpxKpBBOvDzT9JsqIaQAQ5Gw0jDLXpylLtM4w6ydj82No0FSnM1q2W61
         Inq/Q8HoVmBOw==
From:   Leon Romanovsky <leon@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@mellanox.com>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the rdma tree
Message-ID: <20201203093905.GB16543@unreal>
References: <20201203184219.285df51f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203184219.285df51f@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Dec 03, 2020 at 06:42:19PM +1100, Stephen Rothwell wrote:
> Hi all,
>
> After merging the rdma tree, today's linux-next build (htmldocs) produced
> this warning:
>
> drivers/infiniband/core/verbs.c:1206: warning: Function parameter or member 'caller' not described in 'ib_create_named_qp'
>
> Introduced by commit
>
>   66f57b871efc ("RDMA/restrack: Support all QP types")

Thanks Stephen,

We really don't need to see anyone using this ib_create_named_qp()
function call directly.

>
> --
> Cheers,
> Stephen Rothwell


