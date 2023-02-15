Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D38E3697AE4
	for <lists+linux-next@lfdr.de>; Wed, 15 Feb 2023 12:34:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbjBOLew (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Feb 2023 06:34:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233521AbjBOLeq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Feb 2023 06:34:46 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C37BE38010
        for <linux-next@vger.kernel.org>; Wed, 15 Feb 2023 03:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676460799;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=zEJ/Uhqxg0AeMUMp7l1Vn2f0i8I+rW1bVURZjF7zQ2s=;
        b=V0bf/q5xmRB9+7YxFba1kLWURv2n1KPQW1eKkZcHsvlVvOTOOkdW6ycNAfxWuyPQ4Xq7lr
        33NnwwYsyzwGJ+L8MY+KtjqoYfj9wi+/KBnwZ/pWDqe7rE9wjgabwzpqMi73z1pFvGsvjF
        gqp9G3QH3n8VMZKY1NRIkeDlbE9J3tk=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-624-QHt1RpFTP6q92cPnDPXJKQ-1; Wed, 15 Feb 2023 06:33:18 -0500
X-MC-Unique: QHt1RpFTP6q92cPnDPXJKQ-1
Received: by mail-ua1-f72.google.com with SMTP id o43-20020ab0596e000000b0038421e4c7deso6695501uad.19
        for <linux-next@vger.kernel.org>; Wed, 15 Feb 2023 03:33:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zEJ/Uhqxg0AeMUMp7l1Vn2f0i8I+rW1bVURZjF7zQ2s=;
        b=OHybpNtHjZLGrYBhLZl7UjfamhYp+kTdVcTCdxmh6XGgRrs1CojQ0H08Ydm/Mtj8Vz
         L4TxWfvF/5sExNFHdjqDdGRd4RZgVlBSJLzyIy0QlXrx+bbwHIdbUCPm5tpYMMh5y0Jq
         16FePRjSzwbv89v1uhEMb386Af1con/z2i5ZZoCz/Q6IALw/RwHLtu7QdH6yUIoTRSfb
         kPjazxWnHydZbXkvMfXNjP6g1hi+TDkB5i8PkGUyCE7p4wuLGm06JLxsSE92pK6BZvaQ
         KzhJbnF/PxowZoSAy0DStqvIqMQ2vg8fQ7N7WEVVVsKldX214DCmeqHnB125U5QQRijC
         cv2w==
X-Gm-Message-State: AO0yUKV1EI+0QQ1pUHHH8IM42m/BpeQTI1xY9K9l9IyzpgzqP3gPt+0K
        QGQzc0kKPqtxnfacCLXBlexOo5udSqnW6yVRjx6vw3cW8mf3yIrQ/gUpVwAK2WL2DxR73E3qZ++
        QifgpbKOr0OJzNxZJpvwxs7LNlPolsJT3t3oXIQ==
X-Received: by 2002:ab0:308d:0:b0:632:a75f:8b40 with SMTP id h13-20020ab0308d000000b00632a75f8b40mr202254ual.72.1676460797549;
        Wed, 15 Feb 2023 03:33:17 -0800 (PST)
X-Google-Smtp-Source: AK7set/m26UI7qpW+qO1L8/fNuQgleYE5hCk9FG/Mv4Pi+II8VixShk2C8TTCRm5eESfJYmwM3zebD7it+5mmLerN8s=
X-Received: by 2002:ab0:308d:0:b0:632:a75f:8b40 with SMTP id
 h13-20020ab0308d000000b00632a75f8b40mr202253ual.72.1676460797347; Wed, 15 Feb
 2023 03:33:17 -0800 (PST)
MIME-Version: 1.0
References: <20230215144117.369ffb5f@canb.auug.org.au>
In-Reply-To: <20230215144117.369ffb5f@canb.auug.org.au>
From:   Paolo Bonzini <pbonzini@redhat.com>
Date:   Wed, 15 Feb 2023 12:33:05 +0100
Message-ID: <CABgObfY70A=qno-=pMgpr8h0Z2Su90QqbyK8VFhxTEWMaPQFsg@mail.gmail.com>
Subject: Re: linux-next: build warning in Linus' tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Tom Lendacky <thomas.lendacky@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Feb 15, 2023 at 4:41 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Building Linus' tree, today's linux-next build (htmldocs) produced
> this warning:
>
> Documentation/admin-guide/hw-vuln/cross-thread-rsb.rst:92: ERROR: Unexpected indentation.
>
> Introduced by commit
>
>   493a2c2d23ca ("Documentation/hw-vuln: Add documentation for Cross-Thread Return Predictions")

I will fix it in the next pull request before 6.2.

Paolo

