Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47ACB16545D
	for <lists+linux-next@lfdr.de>; Thu, 20 Feb 2020 02:38:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727211AbgBTBiY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 Feb 2020 20:38:24 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:34327 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726784AbgBTBiY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 19 Feb 2020 20:38:24 -0500
Received: by mail-qk1-f196.google.com with SMTP id c20so2156907qkm.1;
        Wed, 19 Feb 2020 17:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GpgT11HrgjWFQfXeiCnU+shDArWQ/syReLAvDvizJT0=;
        b=HkFjNXjICbc2pOh4JI2x337BkMQ9PMYaXMXb6jI0sPH2yHMiHigayqFCruQtjFVr4G
         DgLOdceRQ9WGX3YutaS27BJ6I6eXG6SZPVcumHRqxd1z8xunL0VzsgFagQb3Uw1JEw2k
         wnt7BiyoZ6ZqLz4Cvyp+VG3D/o7GGQAuFAs0z+fVNmf1PG2On049Uq9b0GnFIsv5qNDA
         VkzMf6JwLDeJ9X5YbxklNkN7LZRGjaWdA7wUlCQLCHDz2ETEcClgoXaZlkgkPtxyfJy5
         Jyw90z0E47ZsArVsmySJtWcHR0dMcKFUdpp65UBNbVMsizKxdGy3Hij/9ZbPsGnY9rYQ
         +GHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GpgT11HrgjWFQfXeiCnU+shDArWQ/syReLAvDvizJT0=;
        b=BERRSXzbaehRw0MmXD2F3xf2so83oid7fkDoMHGzGCafrPYQ8ucoB+4CombrVzco13
         OxsPjeEFdh1GoPI7Fkwp+8ICZ0+uph0bZhDQrzcpQBfoLJ8jkD56rtarFZU+pEQekgGp
         Lm+l6zLDUmASa8iua96hZItGIgH/CcwG1lEye0n1AeWSiqVSVcbK0rjpcgwJ7GICVrEX
         aOBt3sYlrWFJ/9e0qBtC3G/e1806yyAjKKYJBmLFRGWz6KkK8+JgWUpYV/9J6idAsVb5
         osPaFQ1WOhMCo61duFm5s3x0yxwfn/dbjFRVcDZ2bhI6zcnlipd5Ip7rvXMTCW3BJVhz
         Mo+Q==
X-Gm-Message-State: APjAAAUJnRs+dGhBv7EValh9HvZu7Pu3yI2RKWeYNWopnuBxYlvLFLGW
        32xzlAc2k/EBhVRw+fjTWqzyUaGWHKKinV2+KGJ44s1bXR8=
X-Google-Smtp-Source: APXvYqyTxVwLzprhzVCuX+e2Y8nC4FuYn0wtHUuXS+To9JosB3Z2zM/8nUcqJmf2uxsHkullKFPGjtFTowdhwiRjV1U=
X-Received: by 2002:a37:2710:: with SMTP id n16mr26606714qkn.235.1582162703104;
 Wed, 19 Feb 2020 17:38:23 -0800 (PST)
MIME-Version: 1.0
References: <20200220103105.01d7c0c1@canb.auug.org.au>
In-Reply-To: <20200220103105.01d7c0c1@canb.auug.org.au>
From:   Baolin Wang <baolin.wang7@gmail.com>
Date:   Thu, 20 Feb 2020 09:38:12 +0800
Message-ID: <CADBw62pLjzq83Gzfr0T7fmxFRevb+m5P4LQuq4dPmgRswOhMoQ@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the mmc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Baolin Wang <baolin.wang@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Thu, Feb 20, 2020 at 7:31 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the mmc tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
>
> WARNING: modpost: missing MODULE_LICENSE() in drivers/mmc/host/mmc_hsq.o
> see include/linux/module.h for more information

I am sorry I missed this warning before, and I've sent out a patch to
fix this warning[1]. Thanks for reporting.

[1] https://lore.kernel.org/patchwork/patch/1196938/
