Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9D06165742
	for <lists+linux-next@lfdr.de>; Thu, 20 Feb 2020 07:02:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725995AbgBTGB7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 Feb 2020 01:01:59 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:44256 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbgBTGB7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 20 Feb 2020 01:01:59 -0500
Received: by mail-qt1-f196.google.com with SMTP id j23so2083165qtr.11;
        Wed, 19 Feb 2020 22:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l1SAZDOfe5Y7UwUxWdEtrikDtP05tBKBkNevXDa5dmY=;
        b=J+cnH/SERbHxksupMLfhAYoV7wgUA9KhEu3/k3sFwHlLgjzOd1FuAakTj7f+iJbJPg
         ko01mzlYYf1Az04dqGNAYSKQt1wSZjq7t6kNviTj9QFec/DFbHxasFe2jzpspK2MXoXf
         N1OHy1wBX7xyJA5VPxW3tUzNHHaTMI/VzwBxMfHAsQMnuH6a1IAlqUsdWS+kIaO1Wo9B
         IV/Rmz0jetFxsUguYzYKM1mdzw5FTllDnizu85aO8bz3vFoPkHu5lRYJPKMxblPK0j1n
         Y0FQD23GXf9S/8YqS1bRBeX0j70f/iUXapdLdj6FFchIg4prGqVoNFH6KC8WIy2h3Du7
         H7Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l1SAZDOfe5Y7UwUxWdEtrikDtP05tBKBkNevXDa5dmY=;
        b=jVTdJXD31/X/UuaEdKXl1zkAklwZCkQocrwhg4Uj5KetTr4f6RcHwqi+bsBV6vq7Tp
         3OSNDPCs5jDZNMuuQ6TPDHM8W3co0mtpYaZqPSMa+fPVnMivtO+qBfQC8UBr6SwrKc+D
         yofzdSOs2vjFXP5s3zRkM+AU0CVxq3wlfMikPQ/zqVfPWJqCKOLBbMC3j7V4ghKuiNBp
         dkAnXwUAbROYoLKIk7GwDmVrBwkbZdpcI8LdmTbJYOwDW7qCvln3n3P7Pqb5C7K97myw
         Yz2FPHwE2S1obk77PTRaGFo6tWb2X7bBD4xDgM/O6ZyioeUYVnem2KdbK9QRNnTjcvXJ
         hdGQ==
X-Gm-Message-State: APjAAAVvDZcOSDIo3XAKhGzmIxBxKRwy1lzRJRLTD3AJ2jzeRi0wuBs5
        ONkCoNw/4I+lvhGKzRAbHyweerCGmKcoCuf0YyM=
X-Google-Smtp-Source: APXvYqy6qf9+0eM7IX9ftMMLUdcktph+/PL3yFpp5ozDn2XA2+ON0JFSKqzCw2XTxtKLMjy3xmEHq/EC446Vk9XjVn8=
X-Received: by 2002:aed:2202:: with SMTP id n2mr26124272qtc.4.1582178517204;
 Wed, 19 Feb 2020 22:01:57 -0800 (PST)
MIME-Version: 1.0
References: <20200220144408.359a7e02@canb.auug.org.au> <dba0c486-46e9-0b96-bd71-b9e81b362c85@infradead.org>
In-Reply-To: <dba0c486-46e9-0b96-bd71-b9e81b362c85@infradead.org>
From:   Baolin Wang <baolin.wang7@gmail.com>
Date:   Thu, 20 Feb 2020 14:01:45 +0800
Message-ID: <CADBw62q08iYfm+g2y5GBUH74-TwTGRzforbuyZ_tTZQ6RQ9fzA@mail.gmail.com>
Subject: Re: linux-next: Tree for Feb 20 (mmc/mmc_hsq.c)
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Baolin Wang <baolin.wang@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc <linux-mmc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Randy,

On Thu, Feb 20, 2020 at 1:55 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 2/19/20 7:44 PM, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20200219:
> >
>
> on i386:
>
> WARNING: modpost: missing MODULE_LICENSE() in drivers/mmc/host/mmc_hsq.o

I've already sent out a patch to fix the warning, can you try it?
Sorry for troubles.
https://lore.kernel.org/patchwork/patch/1196938/
