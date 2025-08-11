Return-Path: <linux-next+bounces-7890-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C67D0B2069B
	for <lists+linux-next@lfdr.de>; Mon, 11 Aug 2025 12:57:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD2EE3A3C9B
	for <lists+linux-next@lfdr.de>; Mon, 11 Aug 2025 10:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B2F42798FF;
	Mon, 11 Aug 2025 10:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="MOC9jVQY"
X-Original-To: linux-next@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714D9278E7B
	for <linux-next@vger.kernel.org>; Mon, 11 Aug 2025 10:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754909796; cv=pass; b=egRMbrmtRZjgZWa+K5fGKN3ZiRVl10duxbe9fIx/OWkVTp8cqhAeVx7x4p9lCv4h2rGxgKd+2DTc91tDsDlMqtQtVY3iv47C1qDUfH1bYZrhn5/iyTYmbrn6w7I4Ol9Q/SIEUFo/fLz1gpwjWNVhXmHSEutwrpgqHBYsZJQ5Sxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754909796; c=relaxed/simple;
	bh=VxsT5ybCorAoQQbzOk/buWM2fBtdmQlNTzBki2dXZyU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o8leQPb0CAQ+6bywBp6xd/mUy5+6rb36qCPFkw5RaiOg2asmJd6+2jWi1iYmnChRdQrofVNtBgAMjxatQQWYhPp+o70aU5IaSyvqpJX6vv10BQRomdWqyixeaRcyPdZ2M9KXM4QvLnn7RfpgmR20W8PUFw0+r1QjONV9d7XTDEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=MOC9jVQY; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1754909767; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=g0Pss77BdVF5GyA3MPtntNOEY3Jwe6jfGJzrJH4rnT59wW/RSVp85D1kxXv/jf/mjvsGYI4fU8gGQa/eeBQ+iRlYqIWP2cyJQGicWqi4c1UCApVNozbN6B08x8ep/nGz65B5cEvkck5KREW+oDGt+gZFX6nXlXFTJW/Qt0MbbrE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1754909767; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=G+Em1yigSYKGpSutasCgI5Mjtpjuuyzd78rKbkGKgP8=; 
	b=d9I/kVuYQhF/LLHJcokBl/D3ad5lOEQOJzzwj4/hN7TEHJDd7QTzhsOLeXsV4JGCwOz8TYAftHvfO36P2llSPFXWBYgeSvbHFVf2gWM9puKdropAq9bc44DPyksw7N/Rl2IEpei1N/p43Q/A/FZzeaF+IXjVWkJgPJqJoYHxoEI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1754909767;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=G+Em1yigSYKGpSutasCgI5Mjtpjuuyzd78rKbkGKgP8=;
	b=MOC9jVQYZ17uT1u72NJCbgBBpXkqR50VJp8aIPh5rToM2WBz8+QNVUulwCKQrlqi
	xAMSMkrhDLJlD9vAVVHfXMYD6fiANm65dYSp5BgefDFmBn0wly5nbB/wytJokEKV71F
	zXxQseQziyUmFLNkymhVuiDjnxbjJdoxfemNw/gY=
Received: by mx.zohomail.com with SMTPS id 1754909766270534.3509971757793;
	Mon, 11 Aug 2025 03:56:06 -0700 (PDT)
Message-ID: <d36e24ce-c2cb-4d44-aacd-aa1e44665c75@collabora.com>
Date: Mon, 11 Aug 2025 13:56:02 +0300
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/virtio: use new debugfs device-centered functions
To: Brahmajit Das <listout@listout.xyz>, airlied@redhat.com,
 kraxel@redhat.com, gurchetansingh@chromium.org, olvaffe@gmail.com,
 simona@ffwll.ch
Cc: linux-next@vger.kernel.org, virtualization@lists.linux.dev,
 dri-devel@lists.freedesktop.org
References: <20250809125443.4011734-1-listout@listout.xyz>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250809125443.4011734-1-listout@listout.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 8/9/25 15:54, Brahmajit Das wrote:
> Replace the use of drm_debugfs_create_files() with the new
> drm_debugfs_add_files() function, which centers the debugfs files
> management on the drm_device instead of drm_minor.
> 
> Signed-off-by: Brahmajit Das <listout@listout.xyz>
> ---
>  drivers/gpu/drm/virtio/virtgpu_debugfs.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_debugfs.c b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
> index 853dd9aa397e..b7c895fe5ddc 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_debugfs.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
> @@ -94,7 +94,7 @@ virtio_gpu_debugfs_host_visible_mm(struct seq_file *m, void *data)
>  	return 0;
>  }
>  
> -static struct drm_info_list virtio_gpu_debugfs_list[] = {
> +static struct drm_debugfs_info virtio_gpu_debugfs_list[] = {
>  	{ "virtio-gpu-features", virtio_gpu_features },
>  	{ "virtio-gpu-irq-fence", virtio_gpu_debugfs_irq_info, 0, NULL },
>  	{ "virtio-gpu-host-visible-mm", virtio_gpu_debugfs_host_visible_mm },
> @@ -105,7 +105,6 @@ static struct drm_info_list virtio_gpu_debugfs_list[] = {
>  void
>  virtio_gpu_debugfs_init(struct drm_minor *minor)
>  {
> -	drm_debugfs_create_files(virtio_gpu_debugfs_list,
> -				 VIRTIO_GPU_DEBUGFS_ENTRIES,
> -				 minor->debugfs_root, minor);
> +	drm_debugfs_add_files(minor->dev, virtio_gpu_debugfs_list,
> +			      VIRTIO_GPU_DEBUGFS_ENTRIES);
>  }

drm_debugfs_create_files() uses drm_info_node, while
drm_debugfs_add_files() uses drm_debugfs_entry. This patch looks wrong
and, AFAICT, doesn't improve anything. Hence, let's keep this code as-is
if there is no real benefit from the change.

-- 
Best regards,
Dmitry

